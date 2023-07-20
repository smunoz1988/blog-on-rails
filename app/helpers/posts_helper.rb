module PostsHelper
    def render_comments_section(post)
        content_tag(:ul, class: 'ul-comments-box') do
          concat content_tag(:h4, 'Comments:', class: 'section-comments')
    
          if post.comments.blank?
            concat content_tag(:li, 'no comments for the moment')
          else
            post.recent_comments.each do |comment|
              concat content_tag(:li, "Username: #{comment.text.blank? ? 'no comments for the moment' : comment.text}")
            end
          end
        end
      end
end
