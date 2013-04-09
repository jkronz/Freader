class Freader.Collections.Feeds extends Backbone.Collection
  url: "/feeds"

  comparator: ->
    @get('name')