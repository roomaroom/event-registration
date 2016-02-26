$(document).on 'click', '.save', ->
  $(this).parent().parent().parent().find('.edit_appointment').submit()

$ ->
  $('#q').keypress ->
    $('.form-search').submit() if $('#q').val().length > 2
    #$('.form-search).submit()


  $('#term').autocomplete
    source: '/appointments/search',
    minLength: 3,
    select:  ( event, ui ) ->
      $('.form-search').submit()
