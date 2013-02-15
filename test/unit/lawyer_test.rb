require 'test_helper'

class AvvoApi::LawyerTest < Test::Unit::TestCase

  context "A valid lawyer object" do 
    setup do 
      @lawyer = AvvoApi::Lawyer.new(valid_lawyer_params)
      stub_request(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers.json").to_return(:body => lawyer_1.to_json)
    end
    
    should "#save successfully" do
      assert @lawyer.save, "lawyer could not be saved"
      assert_requested(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers.json")
      assert_equal "1", @lawyer.id
    end
  end

  context "An invalid lawyer object" do 
    setup do 
      @lawyer = AvvoApi::Lawyer.new(invalid_lawyer_params)
      stub_request(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers.json").to_return(:body => lawyer_errors.to_json, :status => 422)
      @lawyer.save
    end
    
    should "not be created on the server when #save is called" do
      assert_equal nil, @lawyer.id
    end

    should "have errors on the firstname attribute" do 
      assert_match "can't be blank", @lawyer.errors[:firstname].first
    end
  end

  context "AvvoApi::Lawyer.find" do 
    setup do 
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/1.json").to_return(:body => lawyer_1.to_json)
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/2.json").to_return(:body => '', :status => 404)
    end

    should "return a lawyer when called with an existing id" do 
      @lawyer = AvvoApi::Lawyer.find(1)
      assert_equal "Bob", @lawyer.firstname
      assert_equal 'Mr.', @lawyer.prefix
    end
    
    should "raise an exception when called with a nonexistent id" do
      assert_raises ActiveResource::ResourceNotFound do 
        @lawyer = AvvoApi::Lawyer.find(2)
      end
    end
  end

    context "AvvoApi::Lawyer.search" do 
    setup do 
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/search.json?q=dui").to_return(:body => search_results.to_json)
    end

    should "return a hash of lawyer info" do 
      @results = AvvoApi::Lawyer.search(:q => 'dui')
      assert_equal 2, @results["num_results"]
      assert_equal "Bill T. Lawyer", @results["results"].last["name"]
      assert_equal "DUI", @results["results"].first["specialties"].first["name"]
    end
  end

  context "AvvoApi::Lawyer.resolve" do
    
    should "return the appropriate lawyer" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101").to_return(:body => {:lawyers => [{:id => 1}], :annotation => nil}.to_json)
      lawyers = AvvoApi::Lawyer.resolve({:name => 'Mark Britton', :zip_code => 98101})
      assert_requested(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101")
      assert_equal 1, lawyers.length
    end

    should "return an empty array if the lawyer can't be found" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101").to_return(:body => {:lawyers => [], :annotation => nil}.to_json)
      lawyers = AvvoApi::Lawyer.resolve({:name => 'Mark Britton', :zip_code => 98101})
      assert_requested(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/lawyers/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101")
      assert_equal 0, lawyers.length
      
    end
  end

  private

  def valid_lawyer_params
    {
      :firstname => 'Bob',
      :lastname => 'Bobson',
    }
  end
  
  def invalid_lawyer_params
    valid_lawyer_params.tap {|p| p["firstname"] = ""}
  end
  
  def lawyer_1
    {
      :firstname => 'Bob',
      :lastname => 'Bobson',
      :prefix => 'Mr.',
      :id => '1'
    }
  end

  def lawyer_errors
    {
      :errors => [
        "Firstname can't be blank"
      ]
    }
  end

  def search_results
    {
      "num_results" => 2,
      "results" => [
        {
          "id" => 1,
          "name" => "Bob the Lawyer",
          "avvo_rating" => 5.0,
          "client_rating" => 5.0,
          "client_rating_count" => 10,
          "specialties" => [
            {
              "name" => "DUI",
              "percent" => 75
            },
            {
              "name" => "Criminal Defense",
              "percent" => 25
            }
          ],
          "sponsored" => true,
          "ad_details" => {
            "tagline" => "I'm the best! Pick me!",
            "website" => "http://www.avvo.com"
          },
          "phone" => "212-555-1212",
          "address" => "123 Fake St., Seattle, WA 98121",
          "tiny_image_url" => "http://media.avvo.com/ugc/images/head_shot/tinythumbnail_large/1.jpg",
          "image_url" => "http://media.avvo.com/ugc/images/head_shot/thumbnail_large/1.jpg",
          "profile_url" => "http://www.avvo.com/attorneys/1.html",
          "client_reviews_url" => "http://www.avvo.com/attorneys/1/reviews.html"
        },
        {
          "id" => 2,
          "name" => "Bill T. Lawyer",
          "avvo_rating" => 10.0,
          "client_rating" => 0.0,
          "client_rating_count" => 0,
          "specialties" => [
            {
              "name" => "DUI",
              "percent" => 100
            }
          ],
          "sponsored" => false,
          "phone" => "212-555-1213",
          "address" => "123 Fake St., Suite 2B, Seattle, WA 98121",
          "tiny_image_url" => "http://media.avvo.com/ugc/images/head_shot/tinythumbnail_large/2.jpg",
          "image_url" => "http://media.avvo.com/ugc/images/head_shot/thumbnail_large/2.jpg",
          "profile_url" => "http://www.avvo.com/attorneys/2.html",
          "client_reviews_url" => "http://www.avvo.com/attorneys/2/reviews.html"
        },
      ],
    }
  end
  
end
