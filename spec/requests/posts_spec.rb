require '../rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "works! (now write some real specs)" do
      get posts_index_path
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get posts_path
      expect(response).to render_template(:index)
    end
   
    it "includes correct placeholder text in the response body" do
      get posts_path
      expect(response.body).to include("Posts here")
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get post_path(2)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get post_path(2)
      expect(response).to render_template(:show)
    end

    it "includes correct placeholder text in the response body" do
      get post_path(2)
      expect(response.body).to include("Posts Show")
    end
  end
end
