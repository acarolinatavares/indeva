class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :rg
      t.integer :store_id

      t.timestamps
    end
  end
end
