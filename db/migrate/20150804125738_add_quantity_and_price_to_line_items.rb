class AddQuantityAndPriceToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantity, :integer
    add_column :line_items, :price, :integer
  end
end
