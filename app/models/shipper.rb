class Shipper < ActiveRecord::Base

  has_many :orders

  validates :company_name, presence: true

end
