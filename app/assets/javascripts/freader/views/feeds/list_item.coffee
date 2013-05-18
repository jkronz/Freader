class Freader.Views.Feeds.ListItem extends Backbone.View

  tagName: 'li'

  events:
    'click a': 'selectFeed'

  initialize: (options) =>
    @model = options.model
    @listenTo Backbone, 'feeds:select', @feedSelected

  render: =>
    if @model?
      @$el.html(templates['feeds/feed_item'](@model.toJSON()))
    else
      @$el.html(templates['feeds/all_feeds']())
    return this

  selectFeed: =>
    Backbone.trigger 'feeds:select', @model

  feedSelected: (feed) =>
    if feed == @model
      @$el.addClass("active")
    else
      @$el.removeClass("active")

  onClose: =>
    @undelegateEvents()
    @remove()

