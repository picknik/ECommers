require 'rails_helper'

RSpec.describe LineItem, type: :model do

  let(:line_item){ LineItem.new }

  subject { line_item }

#fields
  it { should respond_to :id }
  it { should respond_to :product }
  it { should respond_to :cart }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }

  it { should be_valid }
end
