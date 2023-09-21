require 'rails_helper'

RSpec.describe Comment, type: :module do
  let(:user) { User.new(name: 'John', photo: 'www.google.com', bio: 'My name is...') }
  let(:post) { Post.new(author: user, title: 'My life', text: "It's my life...") }
  let(:comment) { Comment.new(user:, post:, text: 'Very funny!') }

  context 'After saving the user and post' do
    before do
      user.save
      post.save
      comment.save
    end

    it 'Should reference the user id' do
      expect(comment.user_id).to eq(user.id)
    end

    it 'Should reference the post id' do
      expect(comment.post_id).to eq(post.id)
    end

    it 'The comments counter should be 1' do
      post.reload
      expect(post.comments_counter).to eq(1)
    end

    after do
      user.reload
      post.reload
      comment.destroy
      post.destroy
      user.destroy
    end
  end
end
