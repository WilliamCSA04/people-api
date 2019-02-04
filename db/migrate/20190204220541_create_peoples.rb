class CreatePeoples < ActiveRecord::Migration[5.1]
  def change
    create_table :peoples do |t|
      t.string :name
      t.integer :age
      t.date :birth_date
      t.timestamps
    end
  end
end
