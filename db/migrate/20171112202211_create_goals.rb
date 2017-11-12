class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.date :init_date
      t.date :end_date
      t.date :reference_month
      t.decimal :value
      t.integer :store_id

      t.timestamps
    end
  end
end
