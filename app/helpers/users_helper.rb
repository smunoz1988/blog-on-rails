module UsersHelper
  def user_details(user)
    content_tag(:div, class: 'userDetails') do
      concat(content_tag(:h2, link_to(user.name, user_path(user), class: 'userName')))
      concat(content_tag(:p, "Number of posts: #{user.posts_counter.nil? ? 0 : user.posts_counter}", class: 'postsCounter'))
    end
  end

  def render_flash_messages
    if flash[:success]
      content_tag(:div, flash[:success], class: 'flash-success')
    elsif flash[:alert]
      content_tag(:div, flash[:alert], class: 'flash-alert')
    end
  end
end
