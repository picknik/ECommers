class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name, null: false

      t.integer :units_in_stock
      t.integer :units_on_order, default: 1

      t.float   :price,    precision: 8, scale: 2, null: false
      t.float   :discount, precision: 8, scale: 2

      t.integer :reorder_level, default: 0

      t.timestamps null: false
    end
  end
end
