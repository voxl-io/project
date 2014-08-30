if Meteor.isClient
  Accounts.ui.config
    requestPermissions:
      github: [
        'user'
      ]
    passwordSignupFields: 'USERNAME_ONLY'

  AccountsEntry.config
    homeRoute: 'about'
    dashboardRoute: '/'
    profileRoute: '/profile'
    language: 'en'
