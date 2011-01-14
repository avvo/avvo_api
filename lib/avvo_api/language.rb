# Represents a language. One of the following attributes MUST
# be set when using this model:
# 
# * doctor_id
# * lawyer_id
#
# This model has the following attributes:
#
# * id 
# * name: The language name.
# * specialty_id: The language id. 'name' takes priority over this if both are set.
# 
class AvvoApi::Language < AvvoApi::Base
  belongs_to :lawyer
  belongs_to :doctor
end
