# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@cancelButton = () ->
  $('#cancel-review').on 'click', ->
    $('#review-form').empty()
    $('#write-review').show()
    $("#review-errors").empty()
