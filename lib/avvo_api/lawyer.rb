# Represents a lawyer on Avvo. Attributes include:
# 
#    * id: The id of this lawyer
#    * firstname: the first name of this lawyer
#    * middlename: the middle name of this lawyer
#    * lastname: the last name of this lawyer
#    * suffix: the suffix of the lawyer's name
#    * email_address
#    * website_url
#
#
class AvvoApi::Lawyer < AvvoApi::Base
  def self.resolve(params)
    response = self.get(:resolve, :params => params)
    if response && response["lawyers"]
      response["lawyers"].map do |params|
        new(params.merge({"annotation" => response['annotation']}))
      end
    else
      raise ActiveResource::ResourceNotFound.new(response)
    end
  end
end
