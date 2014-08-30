class @DashboardController extends RouteController
  template: 'dashboard'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  waitOn: ->
    Meteor.subscribe 'projects'

  data: ->
    projects: Projects.find({})
