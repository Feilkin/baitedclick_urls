sha1 = require 'sha1'

hash_url = (url) ->
    sha1(url .. tostring(os.time!))\sub 1, 6

{
    :hash_url
}