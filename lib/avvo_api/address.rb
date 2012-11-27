# Represents an address. The following attribute MUST
# be set when using this model:
#
# * lawyer_id
#
# This model has the following attributes:
#
# * id
# * address_line1
# * address_line2
# * city
# * state
# * postal_code
# * latitude
# * longitude
#
class AvvoApi::Address < AvvoApi::Base
  belongs_to :lawyer
  has_many :phones

  # Returns the 'main' address associated with the passed in
  # professional. This is usually the address you want to
  # use. +params+ is a hash of <tt>{:lawyer_id => lawyer.id}</tt> or
  # <tt>{:doctor_id => doctor.id}</tt>
  def self.main(params)
    response = self.get(:main, params)
    if response && response["id"]
      new(params.merge(response))
    elsif response && response["address"]
      new(params.merge(response["address"]))
    end
  end
end
