class @ProjectViewController extends RouteController
  template: 'project_view'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  data: ->
    project:
      name: 'hi'
