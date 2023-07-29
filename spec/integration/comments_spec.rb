require 'swagger_helper'

describe 'Comments API' do

  path 'api/users/:user_id/posts/:post_id/comments' do

    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json', 'application/xml'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          user_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: [ 'text', 'user_id', 'post_id' ]
      }

      response '201', 'comment created' do
        let(:comment) { { text: 'foo', user_id: 1, post_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { text: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/users/:user_id/posts/:post_id/comments/{id}' do

    get 'Retrieves a comment' do
      tags 'Comments'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'comments found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              text: { type: :string },
              user_id: { type: :integer },
              post_id: { type: :integer }
            },
            required: [ 'id', 'text', 'user_id', 'post_id' ]
          }

        let(:id) { Comment.create(text: 'foo', user_id: 1, post_id: 1) }  
        run_test!
      end

      response '404', 'comments not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end