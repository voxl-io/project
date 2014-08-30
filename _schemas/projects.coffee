@Projects = new Meteor.Collection 'projects'

Project = new SimpleSchema
  name:
    type: String
    label: 'Name'
  pitch:
    type: String
    label: 'Elevator Pitch'
    max: 1000
    autoform:
      rows: 3
  user:
    type: String
    autoValue: ->
      @userId

Projects.attachSchema Project

if Meteor.isServer
  Projects.allow
    insert: (userId, project) ->
      userId is project.user

  Meteor.publish 'my-projects', ->
    Projects.find
      user: @userId
