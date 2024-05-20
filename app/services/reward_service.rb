class RewardService
  def initialize(user)
    @user = user
  end

  def check_rewards
    check_monthly_points_reward
    check_birthday_reward
    check_transaction_count_reward
    check_new_user_reward
  end

  private

  def check_monthly_points_reward
    current_month = Time.current.month
    current_year = Time.current.year
    monthly_points = @user.transactions.where('extract(month from date) = ? AND extract(year from date) = ?', current_month, current_year).sum { |t| t.amount / 100 * (t.is_foreign ? 20 : 10) }
    @user.rewards.create(reward_type: 'Free Coffee', issue_date: Time.current) if monthly_points >= 100
  end

  def check_birthday_reward
    @user.rewards.create(reward_type: 'Free Coffee', issue_date: Time.current) if Time.current.month == @user.birthday_month
  end

  def check_transaction_count_reward
    large_transactions = @user.transactions.where('amount > 100').count
    @user.rewards.create(reward_type: '5% Cash Rebate', issue_date: Time.current) if large_transactions >= 10
  end

  def check_new_user_reward
    if @user.transactions.any? && @user.transactions.order(:date).first.date >= 60.days.ago
      total_spent = @user.transactions.where('date >= ?', @user.transactions.order(:date).first.date).sum(:amount)
      @user.rewards.create(reward_type: 'Free Movie Tickets', issue_date: Time.current) if total_spent > 1000
    end
  end
end
