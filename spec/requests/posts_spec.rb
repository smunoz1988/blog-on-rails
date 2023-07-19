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
  end
end