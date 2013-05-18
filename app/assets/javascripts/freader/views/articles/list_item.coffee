class Freader.Views.Articles.ListItem extends Backbone.View
  initialize: (options) =>
    @model = options.model
    @listenTo @model, 'change', @render

  render: =>
    @$el.html(templates['articles/article_item'](@model.toJSON()))
    return this

  onClose: =>
    @stopListening()
    @undelegateEvents()
    @remove()