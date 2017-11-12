class CreateGoalDateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_date_employees do |t|
      t.integer :goal_date_id
      t.integer :employee_id

      t.timestamps
    end
  end
end
