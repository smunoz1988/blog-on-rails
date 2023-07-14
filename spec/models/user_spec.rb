require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Mike', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }

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

  describe '#recent_posts' do
    it 'returns the most recent 3 posts' do
      user = User.create(name: 'Mike', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
      post1 = Post.create(author: user, title: 'Hello', text: 'This is my first post')
      post2 = Post.create(author: user, title: 'Hello2', text: 'This is my second post')
      post3 = Post.create(author: user, title: 'Hello3', text: 'This is my third post')
      post4 = Post.create(author: user, title: 'Hello4', text: 'This is my fourth post')
      post5 = Post.create(author: user, title: 'Hello5', text: 'This is my fifth post')

      user.recent_posts
    end
  end
end
