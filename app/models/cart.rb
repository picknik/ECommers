class Cart < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items

  def add_product product_id, count: 1

    current_item = line_items.find_by(id: product_id)

    if current_item
      current_item += count
    else
      current_item = line_items.build product_id: product_id
      current_item.quantity = count
      current_item.price    = current_item.product.price
    end

    current_item
  end

  def add_product! product_id, count: 1
    current_item = add_product product_id, count: count
    current_item.save!
  end
end
