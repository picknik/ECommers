class Product < ActiveRecord::Base

  validates :name,  presence: true,
                    length: { maximum: 256 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0.1 }

  def total
    dc = 1 - discount
    price * dc
  end

  def can_buy? count
    return false if units_on_order > count || units_in_stock < count
    return true
  end
end
