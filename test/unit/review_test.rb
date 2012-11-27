require 'test_helper'

class AvvoApi::ReviewTest < Test::Unit::TestCase

  context "AvvoApi::Review" do
    should "belong_to :lawyer" do
      assert_contains(AvvoApi::Review.belongs_to_associations.map(&:attribute), :lawyer)
    end
  end

end
