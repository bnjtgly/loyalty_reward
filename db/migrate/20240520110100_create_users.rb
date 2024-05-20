class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.integer :birthday_month
      t.integer :points
      t.string :tier

      t.timestamps
    end
    add_index :users, :birthday_month
  end
end
