class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :required_date
      t.date :shipped_date

      t.string :city
      t.string :address
      t.string :region
      t.string :postal_code
      t.string :country

      t.boolean :accepted
      t.boolean :shipped
      t.boolean :cancelled
      t.boolean :delivered

      t.timestamps null: false
    end
  end
end
