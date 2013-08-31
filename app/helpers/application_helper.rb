module ApplicationHelper
  def back_button
    link_to 'Back', posts_path, class: 'btn'
  end

  def fix_url(url)
    url.starts_with?('http') ? url : "http://#{url}"
  end

  def display_datetime(dt)
    dt.strftime("%b %d, %Y at %I:%M%P")
  end

  def post_creator?(obj)
    obj.creator == current_user
  end
end