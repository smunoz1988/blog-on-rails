require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user1) { User.create(name: 'Mike', photo: 'https://example.com/mike.jpg', posts_counter: 1) }
  let!(:user2) { User.create(name: 'Tom', photo: 'https://example.com/tom.jpg', posts_counter: 3) }
end
