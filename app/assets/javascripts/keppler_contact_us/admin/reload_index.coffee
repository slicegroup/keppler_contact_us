$(window).load ->
  reloadIndex = ->
    $('.toolbar-item .icon-reload').click ->
      $('.objects-container').addClass 'hidden'
      $('.listing-preloader').removeClass 'hidden'

  reloadIndex()
  return