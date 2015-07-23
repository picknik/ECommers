require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category){
    Category.new({ name: 'Notebooks', description: 'computers for home work' })
  }

  subject { category }

#fields
  it { should respond_to :name }
  it { should respond_to :description }
  it { should respond_to :picture }
  it { should respond_to :created_at }
  it { should respond_to :updated_at}

#has_and_belongs_to_many
  it { should respond_to :products }

  it { should be_valid }

  describe "when name is not presence" do
    before { category.name = ' ' }
    it { should_not be_valid }
  end

  describe "when a category name is too long" do
    before { category.name = 'a' * 129 }
    it { should_not be_valid }
  end

  describe "when the name is already taken" do
    before {
      dup = category.dup
      dup.name.upcase!
      dup.save!
    }
    it { should_not be_valid }
  end

  describe "when descriptions is not presence" do
    before { category.description = ' ' }
    it { should_not be_valid }
  end

  describe "when a category is saved" do
    let(:name){ 'MORE' }
    let(:description){ 'this is an open letter' }
    before {
      category.name = name
      category.description = description
      category.save!
    }
    it "should downcased a name" do
      expect(category.reload.name).to eq name.downcase
    end
    it "should capitalized a description" do
      expect(category.reload.description).to eq description.capitalize
    end
  end

  it "associates with product" do
    product = FactoryGirl.build(:product)
    category.products << product
    category.save!
    expect(category.products.count).to be 1
  end
end
