$ ->
  $('#q').keypress ->
    $('.form-search').submit() if $('#q').val().length > 2
    #$('.form-search).submit()
    console.log 'sdf'

