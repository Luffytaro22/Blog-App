require 'rails_helper'

RSpec.describe "User", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users" # A GET request to /users.

      # expect the body to include the text from users/index.html.erb.
      expect(response.body).to include('<h1>Here is the list of Users</h1>')

      # expect the status to be correct.
      expect(response.status).to eq(200)

      # expect the response to be successful.
      expect(response).to be_successful
    end
  end
end