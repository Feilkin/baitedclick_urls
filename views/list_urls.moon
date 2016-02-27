import Widget from require "lapis.html"

class Index extends Widget
  content: =>
    div class: 'content-container', ->
        element 'table', { class: 'pure-table pure-table-horizontal' }, ->
            for url in *@urls
                tr ->
                    th url.hash
                    td ->
                        a { href: @url_for url }, @site_address .. @url_for url
                    td url.url