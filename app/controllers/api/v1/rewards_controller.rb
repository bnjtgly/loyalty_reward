class Api::V1::RewardsController < ApplicationController
  def index
    users = User.includes(:rewards)

    render json: users.as_json(include: :rewards), status: :ok
  end

  def show
    user = User.find(params[:user_id])
    rewards = user.rewards

    render json: rewards, status: :ok
  end
end
