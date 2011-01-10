require 'test_helper'

class AvvoApi::PhoneTest < Test::Unit::TestCase

  context "AvvoApi::Phone" do
    should "belong_to :address" do
      assert_contains(AvvoApi::Phone.belongs_to, :address)
    end
    
    should "build successfully with PhoneType constants" do
      phone = AvvoApi::Phone.new(:phone_number => '2125551212', :phone_type_id => AvvoApi::PhoneType::OFFICE, :address_id => 1, :lawyer_id => 1)
      assert_equal 2, phone.phone_type_id
    end
  end

end
