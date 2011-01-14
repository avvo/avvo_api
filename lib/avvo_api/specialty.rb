# Represents a specialty. One of the following attributes MUST
# be set when using this model:
# 
# * doctor_id
# * lawyer_id
#
# This model has the following attributes:
#
# * id 
# * specialty_name: The name of this specialty. 
# * specialty_percent: The percent of time this professional spends in this specialty
# * specialty_start_date: When this professional started practicing this specialty.
# * number_cases_handled: The number of cases handled within this specialty
# * description: Additional information about this specialty.
# 
class AvvoApi::Specialty < AvvoApi::Base
  belongs_to :lawyer
  belongs_to :doctor
end
