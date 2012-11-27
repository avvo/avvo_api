# Represents a review for a professional. The following attribute
# MUST be set when using this model:
#
# * lawyer_id
#
# This model has the following attributes:
#
# * id
# * overall_rating: The overall rating (out of 5 stars) given by this review.
# * title: The review's title
# * body: The first 150 characters of the review's body
# * url: A link to the review on Avvo
# * posted_by: The author of the review
# * posted_at: The date this review was posted
# * updated_at: The last time this review was updated
#
class AvvoApi::Review < AvvoApi::Base
  belongs_to :lawyer
end
