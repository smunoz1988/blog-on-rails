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
end