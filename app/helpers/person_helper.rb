class PersonHelper

  # Any method that starts with self, is a static method

  # This method calculates the difference between two dates in years.
  # The second parameter is optional, if no value is passed to newest, it will use the result of Time.current instead
  def self.years_between_dates(oldest, newest = Time.current)
    ((newest - oldest) / 1.year).round
  end

  # This method returns true if the two parameters are equal, false otherwise.
  def self.is_a_valid_age?(new_age, calculated_age)
    new_age == calculated_age
  end

end