$ ->
  fieldsCount
  maxFieldsCount = 2
  $addLink = $('a.add_nested_fields')

  toggleAddLink = ->
    $addLink.toggle fieldsCount <= maxFieldsCount

  $(document).on 'nested:fieldAdded', ->
    fieldsCount += 1
    toggleAddLink()

  $(document).on 'nested:fieldRemoved', ->
    fieldsCount -= 1
    toggleAddLink()

  fieldsCount = $('form .fields').length
  toggleAddLink()
