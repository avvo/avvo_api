# Represents a user on Avvo. Attributes include:
#
#    * email_address: the email address of the user
#    * permissions: array of permission strings
#
class AvvoApi::User < AvvoApi::Base

  def self.authenticate(email_address, password)
    response = self.post(:authenticate, {}, {:email_address => email_address, :password => password}.to_json)
    if response.respond_to?(:body)
      response = format.decode(response.body)
      if response && response["user"]
        new(response["user"])
      end
    else
      new(response)
    end
  rescue ActiveResource::ResourceInvalid
    nil
  end

  def self.current
    response = self.get(:current)
    if response.respond_to?(:body)
      response = format.decode(response.body)
      if response && response["user"]
        new(response["user"])
      end
    else
      new(response)
    end
  rescue ActiveResource::ResourceInvalid
    nil
  end

end
