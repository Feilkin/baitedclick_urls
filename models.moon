import Model from require "lapis.db.model"

class Urls extends Model
    @primary_key: { 'id', 'hash' }
    @timestamp: true

    url_params: (req, ...) =>
        'url_redirect', {hash: @hash}, ...

{
    :Urls
}