import types, create_table from require "lapis.db.schema"

{
    [0001]: =>
        create_table 'urls', {
            { 'id',         types.serial }
            { 'hash',       types.text }
            { 'url',        types.text }
            { 'creator',    types.text }
            { 'views',      types.integer }
            { 'delete_pwd', types.text }
            { 'created_at', types.time }
            { 'updated_at', types.time }
        }
}