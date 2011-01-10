# Constants to be used for +phone_type_id+ in AvvoApi::Phone
module AvvoApi::PhoneType
  UNKNOWN = 1
  OFFICE = 2
  FAX = 3
  MOBILE = 4
end

# Represents a phone number tied to an address. One of the
# following attributes MUST be set when using this model:
# 
#   * doctor_id
#   * lawyer_id
#
# Additionally, the following attribute MUST be set when using this model:
# 
#   * address_id
#
# This model has the following attributes:
#
#   * id 
#   * phone_number: The phone number. Will be normalized by Avvo.
#   * phone_type_id: The type of the phone number, as an AvvoApi::PhoneType constant.
#
class AvvoApi::Phone < AvvoApi::Base
  belongs_to :address
end
