module ApplicationHelper

  def full_title(page_title)
    base_title = "Craig Burton"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, :class => class_name) do
      if class_name == '' then
        link_to link_text, link_path
      else
        link_to link_text, '#'
      end
    end
  end

end
