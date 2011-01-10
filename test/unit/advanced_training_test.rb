require 'test_helper'

class AvvoApi::AdvancedTrainingTest < Test::Unit::TestCase

  context "AvvoApi::AdvancedTraining" do
    should "belong_to :doctor" do
      assert_contains(AvvoApi::AdvancedTraining.belongs_to, :doctor)
    end
  end

end
