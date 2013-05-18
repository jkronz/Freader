class Freader.Models.Article extends Backbone.Model

  url: =>
    "/articles/#{@get('id')}"
