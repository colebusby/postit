module ApplicationHelper
  def back_button
    link_to 'Back', posts_path, class: 'btn'
  end
end