require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'works!' do
      get '/users/514/posts'
      expect(response).to have_http_status(200)
    end
    it 'template works!' do
      get '/users/514/posts'
      expect(response).to render_template(:index)
    end
    it 'the response body includes correct placeholder text' do
      get '/users/514/posts'
      expect(response.body).to include('John Doe')
    end
  end

  describe 'GET /posts/:id' do
    it 'works!' do
      get '/users/514/posts/404'
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
