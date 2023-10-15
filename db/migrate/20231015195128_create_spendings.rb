class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :amount
      t.string :description
      t.timestamps
    end
  end
end
