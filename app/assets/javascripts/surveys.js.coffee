$('form').on 'click', '.remove_fields', (event) ->
  $(this).prev('input:hidden').val('1')
  $(this).closest('.fields').hide()
  event.preventDefault()

$('form').on 'click', '.add_fields', (event) ->
  time = new Date().getTime()
  regexp = new RegExp($(this).data('id'), 'g')
  $(this).before($(this).data('fields').replace(regexp, time))
  event.preventDefault()

$('form').on 'click', '.textareautosize', (event) ->
  element = $(this).closest(":has(li)").find("textarea").last()
  element.focus()
  element.bind 'input keyup change cut paste', ->
    element.css("height", 'auto');
    element.css("height", element[0].scrollHeight + 3 + 'px');



