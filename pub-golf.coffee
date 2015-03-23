@Team = new Mongo.Collection 'Team'

Router.route '/', ->
  @render 'home'

Router.route '/rules', ->
  @render 'rules'

Router.route '/team', ->
  @render 'team'

Router.route '/createTeam', ->
    @render 'createTeam'

Router.route '/searchTeam', ->
    @render 'searchTeam'