require 'rails_helper'

RSpec.describe Shipper, type: :model do

  let(:shipper){ Shipper.new({
                                 company_name: "Sender",
                                 phone: '+1-(356)-2523-353'
                             })
  }

  subject { shipper }

  it { should respond_to :company_name }
  it { should respond_to :phone }
  it { should respond_to :orders }

  it { should be_valid }

  describe "when company_name not presence" do
    before { shipper.company_name = ' ' }
    it { should_not be_valid }
  end
end
