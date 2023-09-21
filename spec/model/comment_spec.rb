require 'rails_helper'

RSpec.describe Comment, type: :module do
		user = User.new(name: 'John', photo: 'www.google.com', bio: 'My name is...', id: 1)
		post = Post.new(author: user, title: 'My life', text: "It's my life...", id: 2)
		comment = Comment.new(user: user, post: post, text: 'Very funny!')

		it 'Should reference the user id' do
			expect(comment.user_id).to eq(1)
		end

		it 'Should reference the post id' do
			expect(comment.post_id).to eq(2)
		end
end