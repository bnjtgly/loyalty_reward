require 'rails_helper'

RSpec.describe "Api::V1::Transactions", type: :request do
  describe "POST /api/v1/transactions" do
    it "creates a new transaction" do
      user = User.create(first_name: "John", last_name: "Doe", birthday_month: 5)
      params = {
        transaction: {
          user_id: user.id,
          amount: 100,
          is_foreign: false
        }
      }

      post "/api/v1/transactions", params: params

      expect(response).to have_http_status(:created)
    end
  end
end
