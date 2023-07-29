require 'swagger_helper'

describe 'Posts API' do

  path 'api/users/:user_id/posts' do

    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json', 'application/xml'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string },
          user_id: { type: :integer }
        },
        required: [ 'title', 'text', 'user_id' ]
      }

      response '201', 'post created' do
        let(:post) { { title: 'foo', text: 'bar', user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'foo' } }
        run_test!
      end
    end
  end
  
  path 'api/users/:user_id/posts' do

    get 'Retrieves all posts' do
      tags 'Posts'
      produces 'application/json', 'application/xml'
      parameter name: :user_id, in: :path, type: :string

      response '200', 'posts found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              text: { type: :string },
              user_id: { type: :integer }
            },
            required: [ 'id', 'title', 'text', 'user_id' ]
          }

        let(:id) { Post.create(title: 'foo', text: 'bar', user_id: 1) }
        run_test!
      end

      response '404', 'posts not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/users/:user_id/posts/{id}' do

    get 'Retrieves a post' do
      tags 'Posts'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'posts found' do
        schema type: :array,
          items: {
            type: :object,
            properties: {
              id: { type: :integer },
              title: { type: :string },
              text: { type: :string },
              user_id: { type: :integer }
            },
            required: [ 'id', 'title', 'text', 'user_id' ]
          }

        let(:id) { Post.create(title: 'foo', text: 'bar', user_id: 1) }  
        run_test!
      end

      response '404', 'posts not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
