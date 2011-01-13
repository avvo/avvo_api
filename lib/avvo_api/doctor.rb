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
  has_many :addresses
  has_many :reviews
  has_many :schools
  has_many :languages
  has_many :specialties
  has_many :advanced_trainings
  has_one :headshot
  include AvvoApi::ProfessionalMethods
end
