require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'This is a post', comments_counter: 2, likes_counter: 1) }

  before { subject.save }

  it 'Title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

end
