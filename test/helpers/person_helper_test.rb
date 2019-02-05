require "test_helper"

class PersonHelperTest < ActiveSupport::TestCase

  test "Should return true if a and b are equal" do
    a = 0
    b = 0
    assert PersonHelper.is_a_valid_age?(a, b)
  end

  test "Should return false if a and b are different" do
    a = 1
    b = 0
    assert_not PersonHelper.is_a_valid_age?(a, b)
  end

  test "The years_between_dates should return 10" do
    date = 10.years.ago
    assert PersonHelper.years_between_dates(date) == 10
  end

  test "The years_between_dates should return 9" do
    date = 9.years.ago
    assert_not PersonHelper.years_between_dates(date) == 10
  end

end