$(document).on 'click', '.save', ->
  console.log this
  $(this).parent().parent().parent().find('.edit_appointment').submit()

$ ->
  # $('#q').keypress ->
  #   $('.form-search').submit() if $('#q').val().length > 2
  #   #$('.form-search).submit()
  #   console.log 'sdf'


  $('#term').autocomplete
    source: '/appointments/search'
    minChars: 3,
    select:  ( event, ui ) -> 
      $('.form-search').submit()