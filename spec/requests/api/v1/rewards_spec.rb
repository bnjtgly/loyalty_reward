require 'rails_helper'

RSpec.describe "Api::V1::Rewards", type: :request do
  describe "GET /api/v1/users/:user_id/rewards" do
    let(:user) do
      User.create(first_name: "John", last_name: "Doe", birthday_month: 5, points: 500, tier: "gold")

    end

    it "returns http success" do
      get "/api/v1/users/#{user.id}/rewards"
      expect(response).to have_http_status(:success)
    end
  end
end
