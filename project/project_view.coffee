class @ProjectViewController extends RouteController
  template: 'project_view'

  onBeforeAction: ->
    AccountsEntry.signInRequired @
    Session.set 'project-name', @params.name

  unload: ->
    Session.set 'project-name', null

  waitOn: -> [
    Meteor.subscribe 'my-projects'
    Meteor.subscribe 'project-issues', @params.name
  ]

  data: ->
    project: Projects.findOne
      name: @params.name
    issues: Issues.find
      projectName: @params.name
