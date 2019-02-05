class ChangeColumnsToAcceptNull < ActiveRecord::Migration[5.1]
  def change
    change_column :people, :name, :string, null: true
    change_column :people, :age, :integer, null: true
    change_column :people, :birth_at, :datetime, null: true, default: nil
  end
end
