require 'reactive_resource'


module AvvoApi
  # The class that all AvvoApi resources inherit from. This sets up the
  # base URL and URL structure that the rest of the models use to hit
  # Avvo.
  class Base < ReactiveResource::Base

    # The current version of the Avvo API
    API_VERSION = 1
    
    self.site = "https://api.avvo.com/"
    self.prefix = "/api/#{API_VERSION}/"
    self.format = :json
    
  end
end
