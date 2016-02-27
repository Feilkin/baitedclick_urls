import Widget from require "lapis.html"

class Index extends Widget
  content: =>
    div class: 'splash-container', ->
        div class: 'splash', ->
            div class: 'splash-head', ->
                h1 class: 'header', 'Make it shorter!'

                form { class: 'pure-form', method: 'POST', action: @url_for 'post_url'}, ->
                    input { type: 'text', name: 'url', required: true, autofocus: true }
                    input { type: 'submit', name: 'submit', value: 'GO!', class: 'pure-button pure-button-primary' }