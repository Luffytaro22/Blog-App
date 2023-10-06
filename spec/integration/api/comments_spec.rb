require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
	path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
  		parameter name: :user_id, in: :path, type: :integer
  		parameter name: :post_id, in: :path, type: :integer

      get 'Retrieves comments of a post' do
        produces 'application/json'
        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }

        response '200', 'comments retrieved' do
          schema type: :array,
            items: { '$ref' => '#/definitions/comment' }

          run_test!
        end
  end

      post 'Creates a comment' do
        consumes 'application/json'
        produces 'application/json'
        parameter name: :comment, in: :body, schema: {
          type: :object,
          properties: {
            text: { type: :string },
          },
          required: [ 'text' ],
        }

        let(:user) { create(:user) }
        let(:post) { create(:post, user: user) }
        let(:user_id) { user.id }
        let(:post_id) { post.id }
        let(:comment) { { text: 'Great post!' } }

        response '200', 'comment created' do
          schema '$ref' => '#/definitions/comment'

          run_test!
        end

        response '422', 'invalid comment' do
          let(:comment) { { text: '' } }

          run_test!
        end
      end
    end
end
