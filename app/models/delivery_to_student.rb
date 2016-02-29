class DeliveryToStudent < ActiveRecord::Base
  belongs_to :student, class_name: "IterationStudent",
    foreign_key: :iteration_student_id, inverse_of: :delivery_to_students
  belongs_to :delivery_day

  has_many :student_works
end
