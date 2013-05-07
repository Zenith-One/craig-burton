module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Craig Burton"
    if page_title.empty?
      return "#{base_title}, Developer"
    else
      return "#{base_title} | #{page_title}"
    end
  end

  def nav_link(link_text, link_path, icon)
    #figure out if this links to the current page
    class_name = current_page?(link_path) ? 'active' : ''
    full_text = link_text
    unless icon.empty?
      full_text = "<i class=\"#{icon}\"></i>" + full_text
    end

    content_tag(:li, :class => class_name) do
      if class_name == '' then
       link_to(full_text.html_safe, link_path)
      else
        # just link to the top instead. No need for a fresh
        # set of HTTP requests. =)
        link_to(full_text.html_safe, '#')
      end
    end
  end

  def button_link(button_class, link_text, link_path)
    # clearly we want a button.
    classes = "btn"

    # split the classes passed in for parsing
    class_arr = button_class.split(" ")

    class_arr.each do |c|
      # make sure we aren't going to end up with btn-pull-left or btn-btn-whatever
      if not c[0..3].eql? "pull"  and not c[0..2].eql? "btn" then
        c = "btn-" + c
      end
      classes = classes + " " + c
    end
    link_to link_text, link_path, { class: classes }
  end

end
