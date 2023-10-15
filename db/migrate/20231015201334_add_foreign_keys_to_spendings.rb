class AddForeignKeysToSpendings < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :spendings, :user
    add_belongs_to :spendings, :category
  end
end
