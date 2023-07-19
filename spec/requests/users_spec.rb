require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works!' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it 'template works!' do
      get users_path
      expect(response).to render_template(:index)
    end
    it 'the response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include('List of Users')
    end
  end

  describe 'GET /users/:id' do
    it 'works!' do
      get user_path(1)
      expect(response).to have_http_status(200)
    end
  end
  it 'template works!' do
    get user_path(1)
    expect(response).to render_template(:show)
  end
end
