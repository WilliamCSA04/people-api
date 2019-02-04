class RenameColumnBirthDateFromPeoples < ActiveRecord::Migration[5.1]
  def change
    rename_column :peoples, :birth_date, :birth_at
  end
end
