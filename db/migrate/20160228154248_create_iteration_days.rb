class CreateIterationDays < ActiveRecord::Migration
  def change
    create_table :iteration_days do |t|
      t.date :day
      t.references :course_iteration, index: true, foreign_key: true
    end
  end
end
