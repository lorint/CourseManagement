class CreateIterationStudents < ActiveRecord::Migration
  def change
    create_table :iteration_students do |t|
      t.references :student, index: true
      t.references :course_iteration, index: true, foreign_key: true
      t.references :created_by, index: true

      t.timestamps null: false
    end
  end
end
