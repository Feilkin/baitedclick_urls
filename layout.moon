html = require "lapis.html"

class Layout extends html.Widget
    content: =>
        html_5 ->
            head ->
                meta charset: 'utf-8'
                meta name: 'viewport', content: 'width:=device-width, initial-scale=1'
                title @title or "Lapis Page"
                link rel: 'stylesheet', href: 'http://yui.yahooapis.com/pure/0.6.0/pure-min.css'
                link rel: 'stylesheet', href: 'https://fonts.googleapis.com/css?family=Lato:400,900,300'
                link rel: 'stylesheet', href: '/static/style.css'
            body ->
                div class: 'header', ->
                    div class: 'home-menu pure-menu pure-menu-horizontal pure-menu-fixed', ->
                        a class: 'pure-menu-heading', 'baited.click'
                        ul class: 'pure-menu-list', ->
                            li class: 'pure-menu-item', ->
                                a { href: '/', class: 'pure-menu-link' }, 'Index'
                            li class: 'pure-menu-item', ->
                                a { href: '/list', class: 'pure-menu-link' }, 'List'

                @content_for "inner"

                div class: 'rest', ->
                    div class: 'ribbon', '.'