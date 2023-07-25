require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: 'John Doe', photo: 'https://short.url/example', posts_counter: 5)
end