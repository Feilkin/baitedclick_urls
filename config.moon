config = require 'lapis.config'

config "development", ->
    host '127.0.0.1'
    port 8081

    postgres ->
        host "127.0.0.1"
        user "baitedclick"
        password false
        database "baitedclick_urls"