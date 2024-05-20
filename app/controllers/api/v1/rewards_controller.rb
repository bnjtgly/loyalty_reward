class Api::V1::RewardsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    rewards = user.rewards

    render json: rewards, status: :ok
  end
end
