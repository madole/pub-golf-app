## Team ##
Template.team.helpers
    hasTeam: ->
        team = Team.find
            'members.username': Meteor.user().username
        !!team.count()

## Team View ##
Template.teamView.helpers
    teamMembers: ->
        team = Team.findOne
            'members.username': Meteor.user().username
        team.members.map (member) -> member.username


## Create Team ##
teamAlreadyExists = (teamName) ->
    team = Team.find
        'teamName': teamName
    !!team.count()

Template.createTeam.helpers
    teamCreated: -> Session.get 'teamCreated'
    addMembers: -> Session.get 'addMembers'
    teamName: -> Session.get 'teamName'

Template.createTeam.events
    'click .team-name-submit': ->
        teamName = $('#team-name').val()
        unless teamAlreadyExists(teamName)
            Team.insert
                teamName: teamName
                members: []
                setUp: false
                played: false

            Session.set 'teamName', teamName

        Session.set 'teamCreated', true
        console.log Team.findOne
            teamName: teamName

    'click .add-members': ->
        Session.set 'addMembers', true

