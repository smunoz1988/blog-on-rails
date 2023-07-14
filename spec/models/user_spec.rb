require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    subject.posts_counter = -3
    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    subject.posts_counter = 3
    expect(subject).to be_valid
  end

  describe 'recent_posts' do
    it 'should return 3 recent posts' do
      user = User.create(name: 'John Doe', posts_counter: 0)
      Post.create(title: 'This is a post', comments_counter: 2, likes_counter: 1, author_id: user.id)
      Post.create(title: 'This is a post', comments_counter: 2, likes_counter: 1, author_id: user.id)
      post3 = Post.create(title: 'This is a post', comments_counter: 2, likes_counter: 1, author_id: user.id)
      post4 = Post.create(title: 'This is a post', comments_counter: 2, likes_counter: 1, author_id: user.id)
      post5 = Post.create(title: 'This is a post', comments_counter: 2, likes_counter: 1, author_id: user.id)
      expect(user.recent_posts).to eq([post5, post4, post3])
    end
  end
end
