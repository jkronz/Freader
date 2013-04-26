class Freader.Views.Feeds.List extends Backbone.View
  initialize: (options) =>
    @lineItemViews = []
    @collection = options.collection
    @listenTo @collection, 'reset add', @renderFeeds
    @render()

  render: =>
    @$el.html(templates['feeds/list']())
    return this

  renderFeeds: =>
    @closeLineItems()
    node = document.createDocumentFragment()
    @collection.each (feed) =>
      feedView = new Freader.Views.Feeds.ListItem({model: feed})
      @lineItemViews.push(feedView)
      node.appendChild(feedView.render().el)
    @$(".nav-list").append(node)

  closeLineItems: =>
    _.each @lineItemViews, (vw) =>
      vw.onClose()
    @lineItemViews = []

  onClose: =>
    @closeLineItems()
    @undelegateEvents()
    @stopListening()
    @remove()