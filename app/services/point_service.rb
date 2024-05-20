class PointService
  def initialize(user, transaction)
    @user = user
    @transaction = transaction
  end

  def update_points
    points = calculate_points
    @user.update(points: @user.points + points)
  end

  private

  def calculate_points
    points = (@transaction.amount / 100).floor * 10
    points *= 2 if @transaction.is_foreign
    points
  end
end
