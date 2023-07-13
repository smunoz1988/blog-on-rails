class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post, foreign_key: 'post_id'

  after_create :increment_like_counter
  after_destroy :decrement_like_counter

  def increment_like_counter
    post.increment!(:likes_counter)
  end

  def decrement_like_counter
    post.decrement!(:likes_counter)
  end
end
