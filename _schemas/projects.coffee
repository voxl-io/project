@Projects = new Meteor.Collection 'projects'

Schemas =
  Project: new SimpleSchema
    name:
      type: 'String'
      label: 'Name'
    pitch:
      type: 'String'
      label: 'Elevator Pitch'
      max: 1000

Projects.attachSchema Schemas.Project
