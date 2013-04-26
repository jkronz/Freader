class Freader.Collections.Feeds extends Backbone.Collection
  url: "/feeds"

  pollInterval: 1000 * 60 * 10

  comparator: ->
    @get('name')

  refresh: ->
    @fetch
      reset: true

  load: ->
    @refresh()
    setInterval(@refresh, @pollInterval)
