# Constants representing the various values for +phone_type_id+ in AvvoApi::Phone
module AvvoApi::PhoneType

  # There is no type specified for this number
  UNKNOWN = 1

  # This is an office number
  OFFICE = 2

  # This is a fax number
  FAX = 3

  # This is a mobile number
  MOBILE = 4
end

# Represents a phone number tied to an address. The following
# attributes MUST be set when using this model:
#
# * lawyer_id
# * address_id
#
# This model has the following attributes:
#
# * id
# * phone_number:  The phone number. Will be normalized by Avvo.
# * phone_type_id: The type of the phone number, as an AvvoApi::PhoneType
#   constant. (Only applicable when creating or updating records)
# * phone_type:    A string representation of the phone type
#
class AvvoApi::Phone < AvvoApi::Base
  belongs_to :address
end
