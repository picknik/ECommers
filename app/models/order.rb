class Order < ActiveRecord::Base

  validates :city, presence: true
  validates :region, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

end
