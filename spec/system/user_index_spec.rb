require 'rails_helper'

RSpec.describe 'User Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  let!(:user1) { User.create(name: 'Mike', photo: 'https://example.com/mike.jpg', posts_counter: 1) }
  let!(:user2) { User.create(name: 'Tom', photo: 'https://example.com/tom.jpg', posts_counter: 3) }

  it 'displays the username of all other users' do
    visit users_path

    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  it 'displays the profile picture for each user' do
    visit users_path

    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end
end
