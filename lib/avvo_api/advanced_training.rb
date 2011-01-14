# Constants representing the possible values of the
# advanced_training_type_id parameter of AvvoApi::AdvancedTraining
module AvvoApi::AdvancedTrainingType
  
  # Unknown training type
  UNKNOWN = 1 

  # Represents an internship
  INTERNSHIP = 2
  
  # Represents a residency
  RESIDENCY = 3

  # Represents a fellowship
  FELLOWSHIP = 4
end

# Represents advanced training, like residencies, for doctors. This
# model is only applicable to doctors. The following attributes MUST
# be set when using this model:
# 
# * doctor_id
#
# This model has the following attributes:
#
# * id - The model's id
# * advanced_training_type_id -  an AvvoApi::AdvancedTrainingType constant
# * specialty_name - The name of the specialty this advanced training is in
# * hospital_name - The normalized name of the hospital. This will be
#   resolved by Avvo when it is set by this client.
# * graduation_date - The date this training was completed
# 
class AvvoApi::AdvancedTraining < AvvoApi::Base
  belongs_to :doctor
end
