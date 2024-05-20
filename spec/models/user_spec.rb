require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it "is expected to have many transactions" do
      user = User.new
      expect(user.transactions).to be_empty
    end

    it "is expected to have many rewards" do
      user = User.new
      expect(user.rewards).to be_empty
    end
  end

  describe "methods" do
    it "returns the full name" do
      user = User.new(first_name: "John", last_name: "Doe")
      expect(user.full_name).to eq "John Doe"
    end
  end

  describe "defaults" do
    it "sets default values for points and tier" do
      user = User.new
      expect(user.points).to eq 0
      expect(user.tier).to eq 'standard'
    end
  end
end
