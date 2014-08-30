class @DashboardController extends RouteController
  template: 'dashboard'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  waitOn: ->
    Meteor.subscribe 'my-projects'

  data: ->
    projects: Projects.find()
