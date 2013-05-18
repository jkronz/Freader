class Freader.Collections.Articles extends Backbone.Collection

  model: Freader.Models.Article

  initialize: =>
    @feed = null
    @unread = true
    @listenTo Backbone, 'feeds:select', @updateArticles

  updateArticles: (feed) =>
    @feed = feed
    @fetch()

  url: =>
    if @feed?
      temp = "/feeds/#{@feed.get('id')}/articles"
    else
      temp = "/articles"
    if @unread
      temp += "?unread=true"
    temp

