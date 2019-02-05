class Person < ApplicationRecord

  # https://guides.rubyonrails.org/active_record_validations.html
  # Force name and birth_at to have something when create or update a data from Peoples table
  validates :name, :birth_at, presence: true

  # Force age to be a integer, from 0 to 150 when create or update a data from Peoples table
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }, on: :update
  
  # Call method new_age when update a data from Peoples table
  validate :new_age, on: :update

  # Call set_age method before insert new data into peoples table
  before_create :set_age

  private

  # Calculate the age based on birth_at and current datetime
  def set_age
    self.age = PersonHelper.years_between_dates(self.birth_at)
  end

  # This method will be triggered whenever a data from Peoples table is updates
  def new_age
    # This is a Active Record method, return true if the age column is being updated
    if age_changed?

      # Call a static method called years_between_dates from PersonHelper class find at ./app/helpers
      # Another way to call this method is: PersonHelper.years_between_dates(self.birth_at, Time.current)
      years_between_new_age_and_today = PersonHelper.years_between_dates(self.birth_at)

      # After "unless": Call a static method called is_a_valid_age? from PersonHelper class find at ./app/helpers
      # Before "unless: self.errors.add(:age, "Invalid age") will execute unless is_a_valid_age? returns true
      self.errors.add(:age, "Invalid age") unless PersonHelper.is_a_valid_age?(self.age, years_between_new_age_and_today)

    end
  end
end