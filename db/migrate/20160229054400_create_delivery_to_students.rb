class CreateDeliveryToStudents < ActiveRecord::Migration
  def change
    create_table :delivery_to_students do |t|
      t.references :iteration_student, index: true
      t.references :delivery_day, index: true, foreign_key: true
    end
  end
end
