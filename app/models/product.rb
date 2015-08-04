class Product < ActiveRecord::Base

  has_and_belongs_to_many :categories
  belongs_to :supplier
  has_many :line_items

  validates :name,  presence: true,
                    length: { maximum: 256 }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0.1 }

  def total
    price * (1 - discount)
  end

  def can_buy? count
    units_on_order > count || units_in_stock < count ? false : true
  end
end
