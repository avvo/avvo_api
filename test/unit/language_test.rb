require 'test_helper'

class AvvoApi::LanguageTest < Test::Unit::TestCase

  context "AvvoApi::Language" do
    should "belong_to :lawyer" do
      assert_contains(AvvoApi::Language.belongs_to_associations.map(&:attribute), :lawyer)
    end
    should "belong_to :doctor" do
      assert_contains(AvvoApi::Language.belongs_to_associations.map(&:attribute), :doctor)
    end
  end

end
