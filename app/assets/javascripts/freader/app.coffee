class Freader.Application
  constructor: ->
    loginView = new Freader.Views.Users.Login()

  initialize: =>
    @feeds = new Freader.Collections.Feeds()
    @feedsListView = new Freader.Views.Feeds.List({collection: @feeds})
    $(".sidebar-container").html(@feedsListView.render().el)
    @feeds.load()