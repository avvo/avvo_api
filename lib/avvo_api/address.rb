# Represents an address. One of the following attributes MUST
# be set when using this model:
# 
#   * doctor_id
#   * lawyer_id
#
# This model has the following attributes:
#
#   * id
#   * address_line1
#   * address_line2
#   * city
#   * state
#   * postal_code
#   * latitude
#   * longitude
#   * license_id: The id of the license (optionally) associated with this address
# 
class AvvoApi::Address < AvvoApi::Base
  belongs_to :lawyer
  belongs_to :doctor

  # Returns the 'main' address associated with the passed in
  # professional. This is usually the one you want.
  def self.main(params)
    response = self.get(:main, params)
    if response && response["id"]
      new(params.merge(response))
    elsif response && response["address"]
      new(params.merge(response["address"]))
    end
  end
end
