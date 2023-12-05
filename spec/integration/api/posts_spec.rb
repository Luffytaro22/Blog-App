require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  path '/api/v1/users/{user_id}/posts' do
    parameter name: :user_id, in: :path, type: :integer

    get 'Retrieves posts of a user' do
      produces 'application/json'
      let(:user) { create(:user) }
      let(:user_id) { user.id }

      response '200', 'posts retrieved' do
        schema type: :array,
               items: { '$ref' => '#/definitions/post' }

        run_test!
      end
    end
  end
end
