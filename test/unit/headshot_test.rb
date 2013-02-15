require 'test_helper'

class AvvoApi::HeadshotTest < Test::Unit::TestCase

  context "AvvoApi::Headshot" do

    should "belong_to :lawyer" do
      assert_contains(AvvoApi::Headshot.belongs_to_associations.map(&:attribute), :lawyer)
    end

    should "get the correct url" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json").to_return(:body => {:headshot_url => "blah", :updated_at => '2013-02-10T00:46:12-08:00'}.to_json)
      AvvoApi::Headshot.find(:one, :params => {:lawyer_id => 1})
      assert_requested(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
    end

    should "be able to create a new headshot" do
      @headshot = AvvoApi::Headshot.new(:lawyer_id => 1)
      stub_request(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
      @headshot.save
      assert_requested(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
    end

    should "be able to update an existing headshot" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json").to_return(:body => {:headshot_url => "blah", :updated_at => '2013-02-10T00:46:12-08:00'}.to_json)
      @headshot = AvvoApi::Headshot.find(:one, :params => {:lawyer_id => 1})
      stub_request(:put, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
      @headshot.save
      assert_requested(:put, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
    end

    should "be able to destroy a headshot" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json").to_return(:body => {:headshot_url => "blah", :updated_at => '2013-02-10T00:46:12-08:00'}.to_json)
      @headshot = AvvoApi::Headshot.find(:one, :params => {:lawyer_id => 1})
      stub_request(:delete, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
      @headshot.destroy
      assert_requested(:delete, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1/headshot.json")
    end

  end

end
