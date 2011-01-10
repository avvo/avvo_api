require 'avvo_api/base'
require 'avvo_api/lawyer'
require 'avvo_api/doctor'
require 'avvo_api/school'
require 'avvo_api/address'
require 'avvo_api/phone'
require 'avvo_api/language'
require 'avvo_api/specialty'
require 'avvo_api/headshot'
require 'avvo_api/advanced_training'
require 'avvo_api/review'

# The Avvo API Client.
module AvvoApi
  # Sets up the credentials the ActiveResource objects will use to
  # access the Avvo API. 
  def self.setup(user, password)
    AvvoApi::Base.password = password
    AvvoApi::Base.user = user
  end
end

# Post parameters as <tt>{:lawyer => {...params...}}</tt> so the server
# can separate the object's params from the request params

ActiveResource::Base.include_root_in_json = true
