require 'rails_helper'

RSpec.describe 'User', type: :request do
	before do
		@user = User.create(
          name: 'user1',
          photo: 'https://i.blogs.es/7650e9/spy-x-family/500_333.jpeg',
          bio: 'waku-waku'
        )
	end
  describe 'GET /index' do
    it 'returns http success' do
      get '/users' # A GET request to /users.

      # expect the status to be correct.
      expect(response.status).to eq(200)

      # expect the response to be successful.
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'returns HTTP success' do
      get "/users/#{@user.id}" # A GET request to /users/:id

      expect(response.status).to eq(200)

      expect(response).to be_successful
    end
  end

  after do
  	User.destroy_all
  end
end
