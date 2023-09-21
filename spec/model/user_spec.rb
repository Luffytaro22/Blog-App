require 'rails_helper'

RSpec.describe User,type: :model do
	subject { User.new(name: 'Manuel', photo: 'www.google.com', bio: 'I like ice cream.') }

	context 'Adding a new user without saving it' do
		before { subject.save }

		it 'Name should be present' do
			subject.name = nil
			expect(subject).to_not be_valid
		end

		it 'Photo can be empty' do
			subject.photo = nil
			expect(subject).to be_valid
		end

		it 'Bio can be empty' do
			subject.bio = nil
			expect(subject).to be_valid
		end

		it 'Posts counter should be an integer' do
			expect(subject.posts_counter).to be_an_instance_of(Integer)
		end

		it 'Posts counter should be zero' do
			expect(subject.posts_counter).to eq(0)
		end

		it 'Should return an empty list of Posts' do
			expect(subject.recent_posts).to be_empty
		end
	end
end