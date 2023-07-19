require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_index_path
      expect(response).to have_http_status(200)
    end
  end
end

# spec/requests/posts_request_spec.rb

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get posts_path
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get posts_path
      expect(response).to render_template(:index)
    end
