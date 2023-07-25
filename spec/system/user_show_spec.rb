require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) do
    User.create(
      name: 'Mike Patton',
      photo: 'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80',
      posts_counter: 3
    )
  end

  let(:post) do
    Post.create(
      title: 'My First Post',
      text: 'This is my first post',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before do
    user
    post
    visit user_path(user)
  end

  context 'User profile section' do
    it 'shows the user profile picture' do
      profile_picture = find('.photo')

      expect(profile_picture).to be_visible
      expect(profile_picture['src']).to eq user.photo
    end
  end
end