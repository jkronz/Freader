class Freader.Views.Users.Login extends Backbone.View

  el: '#user-status'

  events:
    'click .sign-in': 'signIn'
    'click .sign-out': 'signOut'

  initialize: (options) =>
    @render()
    navigator.id.watch
      loggedInUser: null
      onlogin: @signedIn
      onlogout: @signedOut

  render: =>
    @$el.html(templates['users/sign_in']())

  authComplete: =>
    @$el.html(templates['users/signed_in'](Freader.app.session.toJSON()))
    Freader.app.initialize()

  signedIn: (assertion) =>
    Freader.app.session = new Freader.Models.Session
      assertion: assertion
    Freader.app.session.save {},
      success: @authComplete
      error: @signOut

  signOutComplete: =>
    @render()

  signedOut: =>
    Freader.app.session.destroy
      success: @signOutComplete

  signIn: (event) =>
    navigator.id.request()
    event?.stopPropagation()

  signOut: (event) =>
    console.log 'signing out'
    navigator.id.logout()
    event?.stopPropagation()

