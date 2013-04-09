class Freader.Models.Feed extends Backbone.Model
  url: =>
    if @isNew()
      "/feeds"
    else
      "/feeds/#{@get('id')}"

  validate: (attrs) =>
    errors = []
    if _.isEmpty(attrs.feed_url)
      errors.push {field: "feed_url", message: "Feed URL cannot be blank"}
    if errors.length then errors else null