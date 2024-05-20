class CreateRewards < ActiveRecord::Migration[7.1]
  def change
    create_table :rewards, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :reward_type
      t.datetime :issue_date

      t.timestamps
    end
    add_index :rewards, :issue_date
  end
end
