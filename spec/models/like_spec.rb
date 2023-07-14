require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#increment_likes_counter' do
    it 'increments the likes_counter of the associated post' do
      user = User.create(name: 'John Doe', posts_counter: 0)
      post = Post.create(author_id: user.id, title: 'Second Post', text: 'More thoughts', comments_counter: 0,
                         likes_counter: 0)

      like = Like.create(author_id: user.id, post_id: post.id)
      expect { like.increment_like_counter }.to change { post.reload.likes_counter }.by(1)
    end
  end
end