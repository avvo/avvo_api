# Represents a doctor on Avvo. Attributes include:
# 
#    * id: The id of this doctor
#    * firstname: the first name of this doctor
#    * middlename: the middle name of this doctor
#    * lastname: the last name of this doctor
#    * suffix: the suffix of the doctor's name
#    * email_address
#    * website_url
#    * profile_url
#
class AvvoApi::Doctor < AvvoApi::Base

  def self.resolve(params)
    response = self.get(:resolve, :params => params)
    if response && response["doctors"]
      response["doctors"].map do |params|
        new(params.merge({"annotation" => response['annotation']}))
      end
    else
      raise ActiveResource::ResourceNotFound.new(response)
    end
  end
end
