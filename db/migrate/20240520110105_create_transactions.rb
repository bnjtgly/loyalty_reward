class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.decimal :amount
      t.datetime :date
      t.boolean :is_foreign

      t.timestamps
    end
    add_index :transactions, :date
    add_index :transactions, :is_foreign
  end
end
