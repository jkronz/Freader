class Freader.Models.Feed extends Backbone.Model
  url: =>
    if @isNew()
      "/feeds"
    else
      "/feeds/#{@get('id')}"

  validate: (attrs) =>
    errors = []
    if _.isEmpty(attrs.url)
      errors.push {field: "url", message: "Feed URL cannot be blank"}
    if errors.length then errors else null