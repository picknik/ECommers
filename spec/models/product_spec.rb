require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) do
    Product.new({
                    name: 'NoteBook',
                    units_in_stock: 100,
                    units_on_order: 1,
                    discount: 0.05,
                    price: 100,
                    reorder_level: 0
                })
  end

  subject { product }

#fields
  it { should respond_to :id }
  it { should respond_to :name }
  it { should respond_to :units_in_stock }
  it { should respond_to :units_on_order }
  it { should respond_to :discount }
  it { should respond_to :price }
  it { should respond_to :reorder_level }
  it { should respond_to :created_at}
  it { should respond_to :updated_at }

#methods
  it { should respond_to :can_buy? } # it takes count in first arg
  it { should respond_to :total }    # it counts price with discount

  it { should be_valid }

  describe "when a name is not presence" do
    before { product.name = ' ' }
    it { should_not be_valid }
  end

  describe "when a name is too long" do
    before { product.name = 'a' * 257 }
    it { should_not be_valid }
  end

  describe "when price is not presence" do
    before { product.price = nil }
    it { should_not be_valid }
  end

  describe "when price is less then min level" do
    before { product.price = 0 }
    it { should_not be_valid }
  end

  describe "when we want to buy 101 units" do
    it "should not be valid" do
      expect(product.can_buy?(101)).to be false
    end
  end

  describe "total price" do
    it "should be 95 dollars" do
      expect(product.total).to eq 95
    end
  end
end
