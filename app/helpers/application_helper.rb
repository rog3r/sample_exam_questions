module ApplicationHelper
  # Flash Messages Display css control by RJO
  def flash_class(flash_type)
    case flash_type.to_s
      when 'alert' then
        'alert-warning' # Yellow 'alert-block'
      when 'error' then
        'alert-danger' # Red   'alert-error'
      when 'notice' then
        'alert-info' # Blue
      when 'success' then
        'alert-success' # Green
      else
        flash_type.to_s
    end
  end
end
