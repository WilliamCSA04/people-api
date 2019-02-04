class ChangeColumnsFromPeoples < ActiveRecord::Migration[5.1]
  def change
    change_column :peoples, :name, :string, null: false
    change_column :peoples, :age, :integer, null: false
    change_column :peoples, :birth_date, :datetime, null: false, default: Time.current
  end
end
