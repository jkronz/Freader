class Freader.Collections.Feeds extends Backbone.Collection
  url: "/feeds"

  model: Freader.Models.Feed

  pollInterval: 1000 * 60 * 10

  comparator: ->
    @get('name')

  refresh: ->
    @fetch
      reset: true

  load: ->
    @refresh()
    setInterval(@refresh, @pollInterval)
