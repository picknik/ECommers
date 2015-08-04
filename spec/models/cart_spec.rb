require 'rails_helper'

RSpec.describe Cart, type: :model do

  let(:cart){ Cart.new }

  subject { cart }

#fields
  it { should respond_to :line_items }
  it { should respond_to :products }

  it { should be_valid }

end
