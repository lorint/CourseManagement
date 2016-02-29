class StudentWork < ActiveRecord::Base
  belongs_to :delivery_to_student
  belongs_to :work_type
end
