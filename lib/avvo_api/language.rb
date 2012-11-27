# Represents a language. The following attribute MUST
# be set when using this model:
#
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
end
