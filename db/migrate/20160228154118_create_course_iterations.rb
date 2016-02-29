class CreateCourseIterations < ActiveRecord::Migration
  def change
    create_table :course_iterations do |t|
      t.date :start
      t.date :end
      t.references :course, index: true, foreign_key: true
      t.references :created_by, index: true
    end
  end
end
