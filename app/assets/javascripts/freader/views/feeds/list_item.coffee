class Freader.Views.Feeds.ListItem extends Backbone.View

  initialize: (options) =>
    @model = options.model

  render: =>
    @$el.html(templates['feeds/feed_item'](@model.toJSON()))
    return this

  onClose: =>
    @undelegateEvents()
    @remove()

