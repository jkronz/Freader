class Freader.Application
  constructor: ->
    loginView = new Freader.Views.Users.Login()

  initialize: =>
    @feeds = new Freader.Collections.Feeds()
    @articles = new Freader.Collections.Articles()
    @feedsListView = new Freader.Views.Feeds.List({collection: @feeds})
    @articlesListView = new Freader.Views.Articles.List({collection: @articles})
    $(".sidebar-container").html(@feedsListView.render().el)
    $(".main-container").html(@articlesListView.render().el)
    newForm = new Freader.Views.Feeds.New()
    $(".new-feed-link").popover
      html: true
      content: newForm.render().el
      placement: 'bottom'
    @feeds.load()
    @articles.fetch()