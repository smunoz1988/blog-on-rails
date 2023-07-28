module PostsHelper
  def render_comments_section(post)
    content_tag(:ul, class: 'commentsContainer') do
      concat content_tag(:h4, 'Comments:', class: 'commentTitle')
  
      if post.comments.blank?
        concat content_tag(:li, 'no comments for the moment')
      else
        post.recent_comments.each do |comment|
          concat content_tag(:li, "Username: #{comment.text.blank? ? 'no comments for the moment' : comment.text}") do
            # Add delete button here, conditionally if the user can delete the comment
            if can?(:destroy, comment)
              concat button_to("Delete", user_post_comment_path(user_id: comment.author.id, post_id: comment.post.id, id: comment.id), method: :delete, class: "btn")
            end
          end
        end
      end
    end
  end

  def render_text_section(post)
    content_tag(:div, class: 'text') do
      concat content_tag(:p, "Comments: #{post.comments_counter.nil? ? 0 : post.comments_counter}",
                         class: 'comment-text')
      concat link_to 'Likes: ', increment_likes_path(post), method: :post, remote: true, class: 'like-counter',
                                                            id: "like-link-#{post.id}"
      concat content_tag(:span, post.likes_counter.nil? ? 0 : post.likes_counter, class: 'like-counter-number',
                                                                                  id: "like-counter-#{post.id}")
    end
  end
end
