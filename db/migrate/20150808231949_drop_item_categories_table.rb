class DropItemCategoriesTable < ActiveRecord::Migration
  def change
    drop_table :item_categories
  end
end
