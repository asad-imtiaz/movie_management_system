$(document).on 'turbolinks:load', ->
  $('.select-date').datepicker
    dateFormat: 'yy-mm-dd'

$(document).on 'turbolinks:load', ->
  $('.carousel').carousel
    interval: 3000;
