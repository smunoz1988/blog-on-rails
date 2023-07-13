require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should be greater than or equal to 0' do
    subject.posts_counter = -3
    expect(subject).to_not be_valid
  end
end
