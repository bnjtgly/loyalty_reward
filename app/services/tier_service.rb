class TierService
  def initialize(user)
    @user = user
  end

  def update_tier
    current_points = calculate_current_points
    highest_past_points = calculate_highest_past_points

    new_tier = if [current_points, highest_past_points].max >= 5000
                 'platinum'
               elsif [current_points, highest_past_points].max >= 1000
                 'gold'
               else
                 'standard'
               end

    if @user.tier != new_tier
      @user.update(tier: new_tier)
      if new_tier == 'gold'
        @user.rewards.create(reward_type: '4x Airport Lounge Access', issue_date: Time.current)
      end
    end
  end

  private

  def calculate_current_points
    one_year_ago = Time.current - 1.year
    @user.transactions.where('date >= ?', one_year_ago).sum { |t| t.amount / 100 * (t.is_foreign ? 20 : 10) }
  end

  def calculate_highest_past_points
    current_year = Time.current.year
    last_year_points = calculate_year_points(current_year - 1)
    two_years_ago_points = calculate_year_points(current_year - 2)
    [last_year_points, two_years_ago_points].max
  end

  def calculate_year_points(year)
    @user.transactions.where(date: Date.new(year).beginning_of_year..Date.new(year).end_of_year).sum { |t| t.amount / 100 * (t.is_foreign ? 20 : 10) }
  end
end
