require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#increment_comments_counter' do
    it 'increments the likes_counter of the associated post' do
      user = User.create(name: 'John Doe', posts_counter: 0)
      post = Post.create(author_id: user.id, title: 'Second Post', text: 'comments', comments_counter: 0,
                         likes_counter: 0)

      comment = Comment.create(author_id: user.id, post_id: post.id, text: 'im happy im sharing my comments!')
      expect { comment.increment_comment_counter }.to change { post.reload.comments_counter }.by(1)
    end
  end

  describe '#decrement_comments_counter' do
    it 'decrements the likes_counter of the associated post' do
      user = User.create(name: 'John Doe', posts_counter: 0)
      post = Post.create(author_id: user.id, title: 'Second Post', text: 'More thoughts', comments_counter: 2,
                         likes_counter: 2)

      comment = Comment.create(author_id: user.id, post_id: post.id, text: 'im happy im sharing my comments!')
      expect { comment.decrement_comment_counter }.to change { post.reload.comments_counter }.by(-1)
    end
  end
end
