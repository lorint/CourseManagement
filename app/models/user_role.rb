class UserRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  has_many :created_courses_ur, class_name: "Course",
    foreign_key: :created_by_id, inverse_of: :created_by
  has_many :created_students_ur, class_name: "IterationStudent",
    foreign_key: :created_by_id, inverse_of: :created_by

  # Acting as a teacher
  has_many :deliveries_ur, class_name: "CurriculumDelivery",
    foreign_key: :taught_by_id, inverse_of: :taught_by

  # Acting as a student
  has_many :iterations_is, class_name: "IterationStudent",
    foreign_key: :student_id, inverse_of: :student
  has_many :iterations, through: :iterations_is, class_name: "CourseIteration",
    foreign_key: :course_iteration_id, source: :course_iteration
end
