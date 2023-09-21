require 'rails_helper'

RSpec.describe Like, type: :module do
	let(:user) { User.new(name: 'John', photo: 'www.google.com', bio: 'My name is...') }
  let(:post) { Post.new(author: user, title: 'My life', text: "It's my life...") }
  let(:like) { Like.new(user: user, post: post) }

  context 'After saving the user and post' do
  	before do
  		user.save
  		post.save
  		like.save
  	end

  	it 'Should reference the user id' do
  		expect(like.user_id).to eq(user.id)
  	end

  	it 'Should reference the post id' do
  		expect(like.post_id).to eq(post.id)
  	end

  	it 'The likes counter should be 1' do
  		post.reload
  		expect(post.likes_counter).to eq(1)
  	end

  	after do
  		user.reload
  		post.reload
  		like.destroy
  		post.destroy
  		user.destroy
  	end
  end
end