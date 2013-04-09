class Freader.Views.Feeds.New extends Backbone.View
  events:
    'submit form': 'createFeed'

  render: =>


  onClose: =>
    @undelegateEvents()
    @remove()