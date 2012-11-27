# Represents a school attended by a professional. The following
# attribute MUST be set when using this model:
#
# * lawyer_id
#
# This model has the following attributes:
#
# * id
# * name: The name of the school. When set, this will be resolved by Avvo.
# * degree_level_name: The level of degree awarded at this school. BA, BS, JD, etc. Will be resolved by Avvo.
# * degree_area_name: Major or area of study. Will be resolved by Avvo.
# * graduation_date: The date the professional graduated from this school.
#
class AvvoApi::School < AvvoApi::Base
  belongs_to :lawyer
end
