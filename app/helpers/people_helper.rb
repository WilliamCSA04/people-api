class PeopleHelper

  def years_between_dates(oldest, newest = Time.current)
    ((newest - oldest) / 365).floor
  end

end