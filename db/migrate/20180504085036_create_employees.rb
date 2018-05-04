class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :phone_number
      t.integer :salary

      t.timestamps
    end
  end
end
