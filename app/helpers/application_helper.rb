module ApplicationHelper

  def set_header_title
    defined?(@header_title) ? @header_title : t('header.default_title')
  end

end
