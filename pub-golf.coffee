@Team = new Mongo.Collection 'Team'

Router.route '/', ->
  @render 'home'

Router.route '/rules', ->
  @render 'rules'

Router.route '/team', ->
  @render 'team'