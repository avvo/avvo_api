require 'test_helper'

class AvvoApi::AddressTest < Test::Unit::TestCase

  context "AvvoApi::Address" do
    should "belong_to :lawyer" do
      assert_contains(AvvoApi::Address.belongs_to_associations.map(&:attribute), :lawyer)
    end
    should "belong_to :doctor" do
      assert_contains(AvvoApi::Address.belongs_to_associations.map(&:attribute), :doctor)
    end
  end

  context "AvvoApi::Address.main" do 
    
    setup do 
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/addresses/main.json").to_return(:body => {:id => '1', :postal_code => '98122'}.to_json)
      @address = AvvoApi::Address.main(:lawyer_id => 1)
    end
    
    should "hit the correct url" do
      assert_requested(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/addresses/main.json")
    end

    should "setup the object correctly" do 
      assert_equal '98122', @address.postal_code
      assert_equal 1, @address.prefix_options[:lawyer_id]
    end
  end

end
