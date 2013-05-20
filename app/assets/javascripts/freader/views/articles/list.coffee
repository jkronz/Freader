class Freader.Views.Articles.List extends Backbone.View

  initialize: (options) =>
    @collection = options.collection
    @articleViews = []
    @collection.on 'add', @renderArticles
    @collection.on 'reset', @resetArticles

  render: =>
    @$el.html(templates['articles/list']())
    return this

  renderArticle: (article) =>
    vw = new Freader.Views.Articles.ListItem(model: article)
    @articleViews.push(vw)
    @$(".article-list").append(vw.render().el)

  resetArticles: =>
    @closeArticles()
    node = document.createDocumentFragment()
    @collection.each (article) =>
      vw = new Freader.Views.Articles.ListItem(model: article)
      node.appendChild(vw.render().el)
    @$(".article-list").html(node)

  closeArticles: =>
    _.each @articleViews, (vw) ->
      vw.onClose()

  onClose: =>
    @closeArticles()
    @stopListening()
    @undelegateEvents()
    @$el.empty()