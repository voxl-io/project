Router.configure
  layoutTemplate: 'layout'

Router.map ->
  @route 'about'

  @route 'profile'

  @route 'dashboard',
    path: '/'

  @route 'projectView',
    path: '/project/:name'

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end '404'
