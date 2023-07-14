require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'This is a post', comments_counter: 2, likes_counter: 1) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

end
