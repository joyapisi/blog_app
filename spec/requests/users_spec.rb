require '../rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_index_path
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "includes correct placeholder text in the response body" do
      get users_path
      expect(response.body).to include("Users here")
    end
  end

  describe "GET #show" do
    it "returns a successful response" do
      get user_path(2)
      expect(response).to have_http_status(:success)
    end

    it "renders the show template" do
      get user_path(2)
      expect(response).to render_template(:show)
    end

    it "includes correct placeholder text in the response body" do
      get user_path(2)
      expect(response.body).to include("Users Show")
    end
  end
end
