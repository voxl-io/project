class @DashboardController extends RouteController
  template: 'dashboard'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  data: ->
    title: 'Hello World'

  run: ->
    console.log 'running'
    super
