require 'rails_helper'

RSpec.describe "Post", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/123/posts" # A GET request to /users/:id/posts.

      # expect the body to include the text from users/index.html.erb.
      expect(response.body).to include('<h1>Here is a list of posts for a given user</h1>')

      # expect the status to be correct.
      expect(response.status).to eq(200)

      # expect the response to be successful.
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
  	it 'returns HTTP success' do
  		get '/users/321/posts/2' # A GET request to /users/:id/posts/:id

  		expect(response.body).to include('<h1>Here is a specific post for a specific user</h1>')

  		expect(response.status).to eq(200)

  		expect(response).to be_successful
  	end
  end
end