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
class AvvoApi::Lawyer < AvvoApi::Base
  include AvvoApi::ProfessionalMethods
end
