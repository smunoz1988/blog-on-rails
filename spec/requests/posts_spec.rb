require 'rails_helper'

RSpec.describe 'Posts', type: :request do
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
      expect(response.body).to include('Here will be deployed the list of posts')
    end
  end
end