import Widget from require "lapis.html"

class Index extends Widget
  content: =>
    div class: 'content-container', ->
        element 'table', { class: 'pure-table pure-table-horizontal' }, ->
            tr ->
                th 'link'
                td ->
                    a { href: @url_for @url }, @site_address .. @url_for @url
            tr ->
                th 'hash'
                td @url.hash
            tr ->
                th 'url'
                td @url.url
            tr ->
                th 'views'
                td @url.views
            tr ->
                th 'creator'
                td @url.creator
            tr ->
                th 'delete password'
                td '*'\rep(@url.delete_pwd\len!)