class RenameTablePeoplesToPeople < ActiveRecord::Migration[5.1]
  def change
    rename_table :peoples, :people
  end
end
