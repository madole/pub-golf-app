## Create Team ##
teamAlreadyExists = (teamName) ->
    team = Team.find
        'teamName': teamName
    !!team.count()

updateTeam = (team) ->
    Session.set 'team', team

getTeam = (teamName) ->
    Team.findOne
        'teamName': teamName

clearForm = ->
    $('#new-member-name').val('')
    $('#new-member-email').val('')

Template.createTeam.helpers
    teamCreated: -> Session.get 'teamCreated'
    addMembers: -> Session.get 'addMembers'
    teamName: -> Session.get 'teamName'
    teamMembers:
        ->
            team = getTeam Session.get 'teamName'
            team?.members

Template.createTeam.events
    'click .team-name-submit': ->
        teamName = $('#team-name').val()
        unless teamAlreadyExists(teamName)
            Team.insert
                teamName: teamName
                members: []
                setUp: false
                played: false
        Session.set 'teamName', teamName unless Session.get 'teamName'
        Session.set 'teamCreated', true
        team = getTeam teamName
        updateTeam team

    'submit .new-members': (event) ->
        event.preventDefault()
        team = Session.get 'team'

        Team.update
            '_id': team._id
        , $push: members:
                'name': event.target.newMemberName.value
                'email': event.target.newMemberEmail.value
        clearForm()
        updateTeam team
