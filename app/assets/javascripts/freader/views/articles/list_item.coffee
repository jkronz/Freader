class Freader.Views.Articles.ListItem extends Backbone.View
  events:
    'click .star': 'toggleFavorite'

  initialize: (options) =>
    @model = options.model
    @listenTo @model, 'change', @render

  render: =>
    @$el.html(templates['articles/article_item'](@model.toJSON()))
    return this

  toggleFavorite: =>
    @model.save
      favorite: !@model.get('favorite')
    return false

  onClose: =>
    @stopListening()
    @undelegateEvents()
    @remove()