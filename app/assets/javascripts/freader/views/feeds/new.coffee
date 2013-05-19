class Freader.Views.Feeds.New extends Backbone.View
  events:
    'submit form': 'createFeed'

  render: =>
    @$el.html(templates['feeds/feed_form']())
    return this

  createFeed: (event) =>
    event.stopPropagation()
    Freader.app.feeds.create
      url: @$('#url').val()
      unread_articles_count: 0
    return false

  onClose: =>
    @undelegateEvents()
    @remove()