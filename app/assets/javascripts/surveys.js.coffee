$('form').on 'click', '.remove_fields', (event) ->
  $(this).prev('input[type=hidden]').val('1')
#  $(this).closest('.fields').remove()
  $(this).closest('.fields').hide()
  event.preventDefault()

$('form').on 'click', '.add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

#$(document).on 'click', 'form .remove_fields', (event) ->
#  event.preventDefault()
#  $(this).closest('.fields').remove()
#

