require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'This is a post', comments_counter: 2, likes_counter: 1) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'Comments counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'LikesCounter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#increment_post_counter' do
    it 'increments the post_counter of the associated user' do
      user = User.create(name: 'John Doe', posts_counter: 0)
      post = Post.create(author_id: user.id, title: 'Second Post', text: 'More thoughts', comments_counter: 0,
                         likes_counter: 0)

      expect { post.increment_post_counter }.to change { user.reload.posts_counter }.by(1)
    end
  end

  describe '#decrement_post_counter' do
    it 'decrements the post_counter of the associated user' do
      user = User.create(name: 'John Doe', posts_counter: 4)
      post = Post.create(author_id: user.id, title: 'Second Post', text: 'More thoughts', comments_counter: 0,
                         likes_counter: 0)

      expect { post.decrement_post_counter }.to change { user.reload.posts_counter }.by(-1)
    end
  end

end
