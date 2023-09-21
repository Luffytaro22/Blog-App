require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Manuel', photo: 'www.google.com', bio: 'I like ice cream.') }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Photo link can be empty' do
  	subject.photo = nil
  	expect(subject).to be_valid
  end

  it 'Bio can be empty' do
  	subject.bio = nil
  	expect(subject).to be_valid
  end

  it 'Posts counter should be an integer' do
  	expect(subject.posts_counter).to be_a(integer)
  end

  it 'Posts counter should be zero' do
  	expect(subject.posts_counter).to be(0)
  end
end