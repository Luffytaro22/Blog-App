require 'rails_helper'

RSpec.describe 'Post', type: :request do
	before do
		@user = User.create(
          name: 'user1',
          photo: 'https://i.blogs.es/7650e9/spy-x-family/500_333.jpeg',
          bio: 'waku-waku'
        )
    @post = Post.create(
    		author: @user,
    		title: 'New post',
    		text: 'My new post...'
    )
    @user.reload
	end
  describe 'GET /index' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts" # A GET request to /users/:id/posts.

      # expect the status to be correct.
      expect(response.status).to eq(200)

      # expect the response to be successful.
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'returns HTTP success' do
      get "/users/#{@user.id}/posts/#{@post.id}" # A GET request to /users/:id/posts/:id

      expect(response.status).to eq(200)

      expect(response).to be_successful
    end
  end

  after do
  	Post.destroy_all
  	User.destroy_all
  end
end
