require 'avvo_api/base'
require 'avvo_api/professional_methods'

# The Avvo API Client.
module AvvoApi

  autoload :Lawyer, 'avvo_api/lawyer'
  autoload :Doctor, 'avvo_api/doctor'
  autoload :School, 'avvo_api/school'
  autoload :Address, 'avvo_api/address'
  autoload :Phone, 'avvo_api/phone'
  autoload :Language, 'avvo_api/language'
  autoload :Specialty, 'avvo_api/specialty'
  autoload :Headshot, 'avvo_api/headshot'
  autoload :AdvancedTraining, 'avvo_api/advanced_training'
  autoload :Review, 'avvo_api/review'
  
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
