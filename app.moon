lapis = require "lapis"

import respond_to, capture_errors from require "lapis.application"
import assert_valid from require "lapis.validate"

import Urls from require 'models'
import hash_url from require 'utils'

class extends lapis.Application
    layout: require 'layout'

    @before_filter =>
        @site_address = 'http://baited.click'

    [index: '/']: =>
        render: true

    [post_url: '/post']: respond_to {
        POST: capture_errors =>
            assert_valid @params, {
                { 'url', exists: true, min_length: 3, max_length: 512 }
            }

            -- add http

            if not @params.url\match '^http'
                @params.url = 'http://' .. @params.url

            url = Urls\create {
                hash: hash_url @params.url
                url: @params.url
                creator: @req.headers['X-Real-IP'] or 'unkown'
                views: 0
                delete_pwd: 'not implemented'
            }

            redirect_to: @url_for('view_url', {hash: url.hash})
    }

    [url_redirect: '/u/:hash']: =>
        if not @params.hash
            return status: 404

        url = Urls\find hash: @params.hash

        if not url
            return status: 404

        url\update {
            views: url.views + 1
        }

        redirect_to: url.url

    [view_url: '/view/:hash']: =>
        @url = Urls\find hash: @params.hash

        if not @url
            return status: 404

        render: true

    [list_urls: '/list']: =>
        @urls = Urls\select!
        render: true