require 'test_helper'

class AvvoApi::PhoneTest < Test::Unit::TestCase

  context "AvvoApi::Phone" do
    should "belong_to :address" do
      assert_contains(AvvoApi::Phone.belongs_to_associations.map(&:attribute), :address)
    end
    
    should "build successfully with PhoneType constants" do
      phone = AvvoApi::Phone.new(:phone_number => '2125551212', :phone_type_id => AvvoApi::PhoneType::OFFICE, :address_id => 1, :lawyer_id => 1)
      assert_equal 2, phone.phone_type_id
    end

    should "be able to return a reasonable string for a phone type id" do
      stub_request(:get, "https://api.avvo.com/api/1/lawyers/1/addresses/1/phones/1.json").to_return(:body => {:id => 1, :phone_number => '212-555-1212', :phone_type => 'Office', :updated_at => Time.now}.to_json)
      phone = AvvoApi::Phone.find(1, :params => {:lawyer_id => 1, :address_id => 1})
      assert_equal "Office", phone.phone_type
    end
  end

end
