require 'rails_helper'

RSpec.describe 'Post Index', type: :system do
  before do
    driven_by(:rack_test)
  end

  user = User.create(name: 'John Doe', photo: 'https://short.url/example', posts_counter: 5)

  it "displays the user's profile picture on user posts page" do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_css("img[src='#{user.photo}']")
  end

  it "displays the user's name on user posts page" do
    visit user_posts_path(user_id: user.id)

    expect(page).to have_content(user.name)
  end
end