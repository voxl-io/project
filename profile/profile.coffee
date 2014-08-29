class @ProfileController extends RouteController
  template: 'profile'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  data: ->
    title: 'Hello World'

  run: ->
    console.log 'running'
    super
