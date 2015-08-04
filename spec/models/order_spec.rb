require 'rails_helper'

RSpec.describe Order, type: :model do

  let(:order){
    Order.new({
                  required_date: 10.day.from_now,
                  shipped_date: 2.hour.from_now,
                  city: 'New York City',
                  address: '760 United Nations Plaza',
                  region: 'New York State',
                  postal_code: '10017',
                  country: 'United Nations'
              })
  }

  subject { order }

#fields
  it { should respond_to :id }
  it { should respond_to :required_date }
  it { should respond_to :shipped_date }
  it { should respond_to :city }
  it { should respond_to :address }
  it { should respond_to :region }
  it { should respond_to :postal_code }
  it { should respond_to :country }
  it { should respond_to :accepted }
  it { should respond_to :shipped }
  it { should respond_to :cancelled }
  it { should respond_to :delivered }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
  it { should respond_to :line_items }
  it { should respond_to :products }
  it { should respond_to :shipper }

  it { should be_valid }

  describe "when city is not presence" do
    before { order.city = ' ' }
    it { should_not be_valid }
  end

  describe "when address is not presence" do
    before { order.address = ' ' }
    it { should_not be_valid }
  end

  describe "when region not presence" do
    before { order.region = ' ' }
    it { should_not be_valid }
  end

  describe "when postal_code is not presence" do
    before { order.postal_code = ' ' }
    it { should_not be_valid }
  end

  describe "when country is not presence" do
    before { order.country = ' ' }
    it { should_not be_valid }
  end
end
