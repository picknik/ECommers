require 'rails_helper'

RSpec.describe Cart, type: :model do

  let(:cart){ Cart.new }

  subject { cart }

#fields
  it { should respond_to :line_items }
  it { should respond_to :products }

#fields
  it { should respond_to :add_product }
  it { should respond_to :add_product! }

  it { should be_valid }

  describe "#add_product" do

    let(:product){ FactoryGirl.create(:product) }

    it "return a line_item" do
      expect(cart.add_product(product.id)).to be_a_new(LineItem)
    end

    it "returns true" do
      expect(cart.add_product(product.id).save).to be true
    end

    it "creates a line_item" do
      expect{
        cart.add_product(product.id).save
      }.to change(cart.line_items, :count).by(1)
    end
  end
end
