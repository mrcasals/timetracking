module ApplicationHelper

  def flash_message
    flash.keys.map do |key|
      message_div(key)
    end.join.html_safe
  end

  private

  def message_div(type)
    content_tag :div, class: 'message ' + type.to_s do
      content_tag :p do
        flash[type]
      end
    end
  end
end
