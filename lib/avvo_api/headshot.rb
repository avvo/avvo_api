# Represents a professional's headshot. Each professional only has one
# headshot, so finding a headshot should happen with the following call:
#
#   AvvoApi::Headshot.find(:one, :lawyer_id => l.id)
#
# When using this model, one of the following attributes MUST be set:
# 
# * doctor_id
# * lawyer_id
#
# This model has the following attribute:
#
# * headshot_url: The url to the standard-size headshot.
# 
class AvvoApi::Headshot < AvvoApi::Base
  singleton

  belongs_to :lawyer
  belongs_to :doctor
end
