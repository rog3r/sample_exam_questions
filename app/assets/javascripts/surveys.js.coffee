jQuery ->
  $(document).on 'click', 'form .remove_fields', (event) ->
    event.preventDefault()
    $(this).closest('.fields').remove()

  $(document).on 'click', 'form .add_fields', (event) ->
    event.preventDefault()
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))