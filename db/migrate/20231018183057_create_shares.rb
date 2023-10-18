class CreateShares < ActiveRecord::Migration[7.0]
  def change
    create_table :shares do |t|
      t.references :author, foreign_key: { to_table: 'users' }
      t.references :recipient, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
