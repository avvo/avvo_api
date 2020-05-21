require 'avvo_api/base'

# The Avvo API Client. All API models live in this module.
module AvvoApi

  autoload :Lawyer, 'avvo_api/lawyer'
  autoload :School, 'avvo_api/school'
  autoload :Address, 'avvo_api/address'
  autoload :Phone, 'avvo_api/phone'
  autoload :Language, 'avvo_api/language'
  autoload :Specialty, 'avvo_api/specialty'
  autoload :Headshot, 'avvo_api/headshot'
  autoload :Review, 'avvo_api/review'
  autoload :Bio, 'avvo_api/bio'

  # Tells this client to use +email+ and +password+ to authenticate to
  # the Avvo API.
  def self.setup(email, password)
    AvvoApi::Base.password = password
    AvvoApi::Base.user = email
  end
end

# Post parameters as <tt>{:lawyer => {...params...}}</tt> so the server
# can separate the object's params from the request params
ActiveResource::Base.include_root_in_json = true
