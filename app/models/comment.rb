class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  def increment_comment_counter
    post.increment!(:comments_counter)
  end

  def decrement_comment_counter
    post.decrement!(:comments_counter)
  end
end
