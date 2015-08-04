class AddShipperIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipper_id, :integer, index: true
  end
end
