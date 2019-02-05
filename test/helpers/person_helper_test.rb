require "test_helper"

class PersonHelperTest < ActiveSupport::TestCase

  test "Should return true if a and b are equal" do
    a = 0
    b = 0
    assert PersonHelper.is_a_valid_age?(a, b)
  end

end