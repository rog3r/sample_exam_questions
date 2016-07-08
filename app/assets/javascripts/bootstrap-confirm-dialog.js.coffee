#$ ->
  $.rails.allowAction = (link) ->
    return true unless link.attr('data-confirm')
    $.rails.showConfirmDialog(link)
    false

  $.rails.confirmed = (link) ->
    link.removeAttr('data-confirm')
    link.trigger('click.rails')

  $.rails.showConfirmDialog = (link) ->
    message = link.attr 'data-confirm'
    html = """
           <div class="modal" id="confirmationDialog">
             <div class="modal-dialog">
               <div class="modal-content">
                 <div class="modal-header">
                   <a class="close" data-dismiss="modal">×</a>
                   <h3>#{message}</h3>
                 </div>
                 <div class="modal-footer">
                   <a data-dismiss="modal" class="btn btn-default">#{link.data('cancel')}</a>
                   <a data-dismiss="modal" class="btn btn-primary confirm">#{link.data('ok')}</a>
                 </div>
               </div>
             </div>
           </div>
           """
    $(html).modal()
    $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)


# ==================================================================================================================


# Override Rails handling of confirmation

#$.rails.allowAction = (element) ->
#  # The message is something like "Are you sure?"
#  message = element.data('confirm')
#  # If there's no message, there's no data-confirm attribute,
#  # which means there's nothing to confirm
#  return true unless message
#  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
#  $link = element.clone()
#  # We don't necessarily want the same styling as the original link/button.
# # .removeAttr('class')
#  # We don't want to pop up another confirmation (recursion)
#  #.removeAttr('data-confirm')
#  # We want a button
#  #.addClass('btn').addClass('btn-danger')
#  # We want it to sound confirmy
#  #.html("#{t('ok')}")
#
#  # Create the modal box with the message
#  modal_html = """
#                    <div class="modal fade" id="myModal">
#                      <div class="modal-dialog">
#                        <div class="modal-content">
#                          <div class="modal-header">
#                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
#                            <h3>Confirm</h3>
#                          </div>
#                          <div class="modal-body">
#                              #{message}
#                          </div>
#                          <div class="modal-footer">
#                            <a data-dismiss="modal" class="btn btn-default">#{$link.data('cancel')}</a>
#                            <a data-dismiss="modal" class="btn btn-primary confirm">#{$link.data('ok')}</a>
#                          </div>
#                        </div>
#                      </div>
#                    </div>
#                   """
#  $modal_html = $(modal_html)
#  # Add the new button to the modal box
#  #$modal_html.find('.modal-footer').append($link)
#  # Pop it up
#  $modal_html.modal()
#  # Prevent the original link from working
#  return false




# ==================================================================================================================





#$.rails.allowAction = (link) ->
#  return true unless link.attr('data-confirm')
#  $.rails.showConfirmDialog(link) # look bellow for implementations
#  false # always stops the action since code runs asynchronously
#
#$.rails.confirmed = (link) ->
#  link.removeAttr('data-confirm')
#  link.trigger('click.rails')
#
#$.rails.showConfirmDialog = (link) ->
#  message = link.attr 'data-confirm'
#  html = """
#         <div class="modal" id="confirmationDialog">
#           <div class="modal-header">
#             <a class="close" data-dismiss="modal">×</a>
#             <h3>#{message}</h3>
#           </div>
#           <div class="modal-body">
#             <p>Are you sure you want to delete?</p>
#           </div>
#           <div class="modal-footer">
#             <a data-dismiss="modal" class="btn">Cancel</a>
#             <a data-dismiss="modal" class="btn btn-primary confirm">OK</a>
#           </div>
#         </div>
#         """
#  $(html).modal()
#  $('#confirmationDialog .confirm').on 'click', -> $.rails.confirmed(link)