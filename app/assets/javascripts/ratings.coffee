# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@initStarRating = () ->
  $('.star-rating').raty
    path: '/assets/'
    readOnly: true
    score: ->
      $(this).attr 'data-score'

@rate = () ->
  $('#star-rating').raty
    path: '/assets/'
    scoreName: 'rating[rating]'
    score: ->
      $(this).attr 'data-score'

@submitRating = () ->
  $('#star-rating').click ->
    $('form#rating-form').submit()

@ready = () ->
  initStarRating()
  rate()
  submitRating()
  $('.star-rating').raty('reload')
  $('#star-rating').raty('reload')

$(document).on('turbolinks:load', ready)
