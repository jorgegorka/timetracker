module ApplicationHelper

  def set_header_title
    defined?(@header_title) ? @header_title : t('header.default_title')
  end

  def render_flash_messages
    flash.collect do |type, errors|
      next if errors.empty?

      content_tag :div, :class=> "notice #{type}" do
        content_tag :ul do
          errors.each { |error| content_tag(:li, error) }
        end
      end
    end
  end
  

end
