class PeopleHelper

  def years_between_dates(date_from, date_to)
    ((date_to - date_from) / 365).floor
  end

end