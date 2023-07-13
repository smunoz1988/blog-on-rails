class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
