class CreateStudentWorks < ActiveRecord::Migration
  def change
    create_table :student_works do |t|
      t.references :delivery_to_student, index: true, foreign_key: true
      t.references :work_type, index: true, foreign_key: true
      t.text :info

      t.timestamps null: false
    end
  end
end
