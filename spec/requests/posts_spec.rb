require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) do
    User.create(
      id: 1,
      name: 'Mike Patton',
      photo: 'https://images.unsplash.com/photo-1525134479668-1bee5c7c6845?ixlib=rb-4.0.3&amp;ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&amp;auto=format&amp;fit=crop&amp;w=687&amp;q=80',
      bio: 'I am a musician',
      posts_counter: 3
    )
  end

  before do
    user
  end

  describe 'GET /posts' do
    it 'works!' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end
    it 'template works!' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end
    it 'the response body includes correct placeholder text' do
      get '/users/1/posts'
      expect(response.body).to include('Mike Patton')
    end
  end

  describe 'GET /posts/:id' do
    it 'works!' do
      get '/users/1/posts/404'
      expect(response).to have_http_status(200)
    end
    it 'template works!' do
      get '/users/514/posts/404'
      expect(response).to render_template(:show)
    end
    it 'the response body includes correct placeholder text' do
      get '/users/514/posts/404'
      expect(response.body).to include('This is the content of my first post')
    end
  end
end
