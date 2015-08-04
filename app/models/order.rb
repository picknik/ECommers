class Order < ActiveRecord::Base

  has_many :line_items
  has_many :products, through: :line_items

  belongs_to :shipper

  validates :city, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

end
