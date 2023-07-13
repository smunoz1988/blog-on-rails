class Post < ApplicationRecord
  validation :title, presence: true, length: { maximum: 250 }
  validation :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validation :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_create :increment_post_counter
  after_destroy :decrement_post_counter

  def increment_post_counter
    author.increment!(:posts_counter)
  end

  def decrement_post_counter
    author.decrement!(:posts_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
