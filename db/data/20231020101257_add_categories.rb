# frozen_string_literal: true

class AddCategories < ActiveRecord::Migration[7.0]
  CATEGORY_NAMES = %w[Traveling Clothing Taxi Cafes Shops Other]

  def up
    CATEGORY_NAMES.each do |name|
      Category.create(name: name)
    end
  end

  def down
    Category.where(name: CATEGORY_NAMES).destroy_all
  end
end
