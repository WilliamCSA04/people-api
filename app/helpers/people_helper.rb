class PeopleHelper

  def self.years_between_dates(oldest, newest = Time.current)
    ((newest - oldest) / 365).floor
  end

  def self.is_a_valid_age?(new_age, calculated_age)
    new_age == calculated_age
  end

end