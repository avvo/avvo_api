module AvvoApi::ProfessionalMethods

  module ClassMethods

    # Search avvo for a list of the top 10 professionals matching the
    # passed-in parameters. Accepts the following parameters:
    #
    # q: The search query
    # loc: The location to search in
    #
    # These parameters match the search boxes on the Avvo website.
    #
    # This method pre-dates the REST API, and thus returns a hash of
    # data rather than API objects. Hopefully, we'll eventually come
    # up with something better. To see an actual response, look at
    # http://api.avvo.com/docs/get/lawyers/search.html
    def search(params)
      response = self.get(:search, params)
      
      if response && response['num-results']
        response
      else
        raise ActiveResource::ResourceNotFound.new(response)
      end
    end

    # Attempts to find a professional on Avvo that matches the
    # passed-in params. Currently accepts the following params:
    #
    # name: The full name of the lawyer you are trying to find
    # phone: The phone number of the lawyer, in the format XXX-XXX-XXXX
    # fax: The fax number of the lawyer, in the format XXX-XXX-XXXX
    # address: The full address of the lawyer
    # zip_code: The zip code of the lawyer
    # email_address: The e-mail address of the lawyer
    def resolve(params)
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

  def self.included(base)
    base.send(:extend, ClassMethods)
  end
end
