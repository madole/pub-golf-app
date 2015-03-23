## Search Team ##
revertNotFoundScreen = ->
    setTimeout ->
        Session.set 'searched', false
    , 3000

Template.searchTeam.helpers
    team: -> Session.get 'team'
    searched: -> Session.get 'searched'

Template.searchTeam.events
    'click .team-name-submit': ->
        teamName = $('#team-name').val()
        team = Team.findOne
            teamName: teamName
        if team then Session.set 'team', team
        Session.set 'searched', true
        if not team then revertNotFoundScreen()
