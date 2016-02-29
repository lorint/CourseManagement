class IterationStudent < ActiveRecord::Base
  belongs_to :student, class_name: "UserRole",
    foreign_key: :student_id, inverse_of: :iterations_is
  belongs_to :course_iteration

  belongs_to :created_by, class_name: "UserRole",
    foreign_key: :created_by_id, inverse_of: :created_students_ur

  has_many :delivery_to_students
end
