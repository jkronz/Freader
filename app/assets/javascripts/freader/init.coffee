unless window.console
  window.console = {}
  window.console.log = (args) =>
    #nothin

window.templates = []
window.Freader =
  Models: {}
  Collections: {}
  Views:
    Feeds: {}
    Articles: {}
    Users: {}

