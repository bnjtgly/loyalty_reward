class User < ApplicationRecord
  has_many :transactions
  has_many :rewards

  # Ensures a default value for points and tier
  after_initialize :set_defaults

  private

  def set_defaults
    self.points ||= 0
    self.tier ||= 'standard'
  end
end
