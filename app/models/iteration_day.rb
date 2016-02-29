class IterationDay < ActiveRecord::Base
  belongs_to :course_iteration

  has_many :delivery_days
end
