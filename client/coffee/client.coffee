Accounts.ui.config
    passwordSignupFields: 'USERNAME_AND_EMAIL'

clearActiveFromNavItems = ->
    $('.navbar-items li').removeClass 'active'

Template.navbar.events
    'click a': (event) ->
        console.log event
        clearActiveFromNavItems()
        $(event.target.parentElement).addClass 'active'

    'click #login-buttons-logout': ->
        Router.go '/'

window.onscroll = ->
    if window.innerHeight + window.scrollY >= document.body.offsetHeight
        $('.footer').fadeIn(1000)
    else
        $('.footer').fadeOut(1000)


