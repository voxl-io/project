class @ProfileController extends RouteController
  template: 'profile'

  onBeforeAction: ->
    AccountsEntry.signInRequired @

  data: ->
    user = Meteor.user()

    if user
      profile: user.profile
      github: user.services.github
      no_user: no
    else
      no_user: yes
