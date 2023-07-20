module UsersHelper
  def user_details(user)
    content_tag(:div, class: 'user_details') do
      concat (content_tag(:h2, link_to(user.name, user_path(user), class: 'user_name')))
      concat (content_tag(:p, "Number of posts: #{user.posts_counter}", class: 'user_post_counter'))
    end
  end
end
