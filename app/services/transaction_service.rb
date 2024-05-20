class TransactionService
  def initialize(user)
    @user = user
  end

  def add_transaction(amount:, date:, is_foreign:)
    ActiveRecord::Base.transaction do
      transaction = @user.transactions.create!(amount: amount, date: date, is_foreign: is_foreign)
      PointService.new(@user, transaction).update_points
      RewardService.new(@user).check_rewards
      TierService.new(@user).update_tier
      transaction
    end
  rescue ActiveRecord::RecordInvalid => e
    # Handle exceptions such as validation errors
    raise e
  end
end
