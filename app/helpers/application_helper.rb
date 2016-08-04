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

  def check_box_for(f, field, html_options={})
    label = html_options[:label].blank? ? field : html_options[:label]

    html = content_tag :div, class: 'form-group checkbox' do
      content_tag :label do
        f.check_box(field) +
            content_tag(:span, class: 'glyphicon glyphicon-ok', style: 'top: 0px !important; position: absolute; margin-left: -19px;  padding-right: 0px;') {} + f.label(label, style: 'padding-left: 10px;')
      end
    end
    html.html_safe
  end
end
