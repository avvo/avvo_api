require 'test_helper'

class AvvoApi::SpecialtyTest < Test::Unit::TestCase

  context "AvvoApi::Specialty" do
    should "belong_to :lawyer" do
      assert_contains(AvvoApi::Specialty.belongs_to, :lawyer)
    end
    should "belong_to :doctor" do
      assert_contains(AvvoApi::Specialty.belongs_to, :doctor)
    end
  end

end
