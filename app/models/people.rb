class People < ApplicationRecord

  validates :name, :birth_at, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }
  
  validate :new_age, on: :update

  private

  def new_age
    if age_changed?
      years_between_new_age_and_today = PeopleHelper.years_between_dates(self.birth_at)
      self.errors.add(:age, "Invalid age") unless PeopleHelper.is_a_valid_age?(new_age, years_between_new_age_and_today)
    end
  end
end