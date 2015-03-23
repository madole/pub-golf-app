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


