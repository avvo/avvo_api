require 'test_helper'

class AvvoApi::DoctorTest < Test::Unit::TestCase

  context "A valid doctor object" do 
    setup do 
      @doctor = AvvoApi::Doctor.new(valid_doctor_params)
      stub_request(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/doctors.json").to_return(:body => doctor_1.to_json)
    end
    
    should "#save successfully" do
      assert @doctor.save, "doctor could not be saved"
      assert_requested(:post, "https://test_account%40avvo.com:password@api.avvo.com/api/1/doctors.json")
      assert_equal "1", @doctor.id
    end
  end
  
  context "AvvoApi::Doctor.resolve" do
    
    should "return the appropriate doctors" do
      stub_request(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/doctors/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101").to_return(:body => {:doctors => [{:id => 1}]}.to_json)
      doctors = AvvoApi::Doctor.resolve({:name => 'Mark Britton', :zip_code => 98101})
      assert_requested(:get, "https://test_account%40avvo.com:password@api.avvo.com/api/1/doctors/resolve.json?params%5Bname%5D=Mark%20Britton&params%5Bzip_code%5D=98101")
      assert_equal 1, doctors.length
    end
  end

  private

  def valid_doctor_params
    {
      :firstname => 'Bob',
      :lastname => 'Bobson',
      :npi_number => '123456'
    }
  end
  
  def doctor_1
    {
      :firstname => 'Bob',
      :lastname => 'Bobson',
      :id => '1'
    }
  end
  
end
