$ ->
  $('#q').keypress ->
    $('.form-search').submit() if $('#q').val().length > 3
    #$('.form-search).submit()
    console.log 'sdf'

