class People < ApplicationRecord

    validates :name, :birth_at, presence: true
    validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 150 }
    
    validate :new_age, on: :update

    private

    def new_age
        if age_changed?
            present = Time.current
            datetime_of_birth = present - self.age.years
            date_of_birth = datetime_of_birth.to_date
            is_a_valid_age = date_of_birth == self.birth_at.to_date
            self.errors.add(:age, "Invalid age")
        end
    end
end