class CreateGoalDates < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_dates do |t|
      t.date :day
      t.decimal :value
      t.integer :goal_id

      t.timestamps
    end
  end
end
