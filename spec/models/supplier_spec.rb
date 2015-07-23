require 'rails_helper'

RSpec.describe Supplier, type: :model do

  let(:supplier){
    Supplier.new({
                     company_name: 'Nix',
                     contact_name: 'John',
                     contact_title: nil,
                     address: 'jump street 2-13',
                     city: 'Los Angels',
                     region: 'California',
                     postal_code: '415463',
                     phone: '+1-(241)-456-4235',
                     skype: 'john.best.seller',
                     fax: '+1-(241)-456-4235',
                     home_page: 'https://example.com'
                 })
  }

  subject{ supplier }

#fields
  it { should respond_to :id }
  it { should respond_to :company_name }
  it { should respond_to :contact_name }
  it { should respond_to :contact_title }
  it { should respond_to :address }
  it { should respond_to :city }
  it { should respond_to :region }
  it { should respond_to :postal_code }
  it { should respond_to :phone }
  it { should respond_to :skype }
  it { should respond_to :fax }
  it { should respond_to :home_page }
  it { should respond_to :updated_at }
  it { should respond_to :created_at }
  it { should respond_to :picture }

#has_many
  it { should respond_to :products }

  it { should be_valid }

  describe "when a name is not precence" do
    before { supplier.company_name = ' ' }
    it { should_not be_valid }
  end

  it "associates with a products as has_many" do
    product_1 = FactoryGirl.create(:product)
    product_2 = FactoryGirl.create(:product)
    supplier.products << product_1
    supplier.products << product_2
    supplier.save!

    expect(supplier.products.first).to be product_1
    expect(supplier.products.last).to  be product_2
    expect(supplier.products.count).to be 2
  end
end
