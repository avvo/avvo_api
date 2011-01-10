# Represents advanced training, like residencies, for doctors. This
# model is only applicable to doctors. The following attributes MUST
# be set when using this model:
# 
#   * doctor_id
#
# This model has the following attributes:
#
#   * id
#   * advanced_training_type_id: an AdvancedTrainingType constant
#   * specialty_name: The name of the specialty this advanced training is in
#   * specialty_id: The ID of the specialty, if known
#   * hospital_name: The normalized name of the hospital. This will be
#                    resolved by Avvo when it is set by this client.
#   * hospital_id: The id of the hospital, if known.
#   * graduation_date: The date this training was completed
# 
module AvvoApi::AdvancedTrainingType
  UNKNOWN = 1
  INTERNSHIP = 2
  RESIDENCY = 3
  FELLOWSHIP = 4
end

class AvvoApi::AdvancedTraining < AvvoApi::Base
  belongs_to :doctor
end
