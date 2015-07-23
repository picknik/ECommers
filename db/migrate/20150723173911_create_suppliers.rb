class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :company_name
      t.string :contact_name
      t.string :contact_title
      t.string :address
      t.string :city
      t.string :region
      t.string :postal_code
      t.string :phone
      t.string :skype
      t.string :fax
      t.string :home_page

      t.timestamps null: false
    end
  end
end
