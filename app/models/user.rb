class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  attribute :posts_counter, :integer, default: 0
  attribute :photo, :string, default: 'https://cdn-icons-png.flaticon.com/512/6075/6075889.png'

  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id'

  before_save :generate_api_token

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= 'user' # Replace 'user' with the default role you want to set
  end

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(16)
  end
end
