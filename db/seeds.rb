# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create users
user1 = User.create(first_name: "Alice", last_name: "Smith", birthday_month: 5)
user2 = User.create(first_name: "Bob", last_name: "Johnson", birthday_month: 8)
user3 = User.create(first_name: "Charlie", last_name: "Brown", birthday_month: 12)



# Create transactions
user1.transactions.create(amount: 200, date: 1.month.ago, is_foreign: false) # Level 1
user1.transactions.create(amount: 500, date: 1.month.ago, is_foreign: true)  # Level 2
user1.transactions.create(amount: 100, date: Date.today, is_foreign: false)  # Level 1

user2.transactions.create(amount: 1500, date: 2.months.ago, is_foreign: false) # Level 2
user2.transactions.create(amount: 50, date: Date.today, is_foreign: true)       # Level 2

user3.transactions.create(amount: 1000, date: Date.today, is_foreign: false)    # Level 1


# Create rewards
user1.rewards.create(reward_type: "Free Coffee", issue_date: Date.today)   # Level 1
user1.rewards.create(reward_type: "5% Cash Rebate", issue_date: Date.today) # Level 2

user2.rewards.create(reward_type: "Airport Lounge Access", issue_date: Date.today) # Level 2
