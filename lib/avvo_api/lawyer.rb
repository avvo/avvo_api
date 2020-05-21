# Represents a lawyer on Avvo. Attributes include:
#
# * id: The id of this lawyer
# * firstname: the first name of this lawyer
# * middlename: the middle name of this lawyer
# * lastname: the last name of this lawyer
# * suffix: the suffix of the lawyer's name
# * email_address
# * website_url
#
class AvvoApi::Lawyer < AvvoApi::Base

  has_many :addresses
  has_many :reviews
  has_many :schools
  has_many :languages
  has_many :specialties
  has_one :headshot
  has_one :bio

  # Search avvo for a list of the top 10 professionals matching the
  # passed-in parameters. Accepts the following parameters:
  #
  # [q] The search query
  # [loc] The location to search in
  #
  # These parameters match the search boxes on the Avvo website.
  #
  # This method pre-dates the REST API, and thus returns a hash of
  # data rather than API objects. Hopefully, we'll eventually come
  # up with something better. To see an actual response, look at
  # http://api.avvo.com/docs/get/lawyers/search.html
  def self.search(params)
    response = self.get(:search, params)

    if response && response['num_results']
      response
    else
      raise ActiveResource::ResourceNotFound.new(response)
    end
  end

  # Attempts to find a professional on Avvo that matches the
  # passed-in params. Currently accepts the following params:
  #
  # [name] The full name of the lawyer you are trying to find
  # [phone] The phone number of the lawyer, in the format XXX-XXX-XXXX
  # [fax] The fax number of the lawyer, in the format XXX-XXX-XXXX
  # [address] The full address of the lawyer
  # [zip_code] The zip code of the lawyer
  # [email_address] The e-mail address of the lawyer
  def self.resolve(params)
    response = self.get(:resolve, :params => params)
    if response && response[collection_name]
      response[collection_name].map do |params|
        new(params.merge({"annotation" => response['annotation']}))
      end
    else
      raise ActiveResource::ResourceNotFound.new(response)
    end
  end
end
