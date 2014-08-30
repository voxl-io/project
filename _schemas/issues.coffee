@Issues = new Meteor.Collection 'issues'

Issue = new SimpleSchema
  name:
    type: String
    label: 'Name'
    index: yes
    unique: yes
    custom: ->
      yes
      ###if Meteor.isClient and @isSet
        Meteor.call 'issueNameUniqueInProject', @value, (err, res) ->
          unless res
            Meteor.issues.simpleSchema().namedContext('createIssueForm').addInvalidKeys [
                name: 'name'
                type: 'notUnique'
              ]###
            
  description:
    type: String
    label: 'Description'
    max: 1000
    autoform:
      rows: 3
  projectName:
    type: String
    autoValue: ->
      Session.get 'project-name'
  assigned:
    type: String

Issues.attachSchema Issue

if Meteor.isServer
  Issues.allow
    insert: (userId, issue) ->
      return yes
      project = Projects.findOne
        _id: issue.projectName
      userId is project.user

  Meteor.publish 'project-issues', (projectName) ->
    Issues.find
      projectName: projectName
