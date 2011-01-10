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
  include AvvoApi::ProfessionalMethods
end
