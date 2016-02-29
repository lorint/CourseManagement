class CourseIteration < ActiveRecord::Base
  belongs_to :course, inverse_of: :iterations

  belongs_to :created_by, class_name: "UserRole",
    foreign_key: :created_by_id, inverse_of: :created_courses_ur

  has_many :iteration_days
  has_many :delivery_days, through: :iteration_days
  has_many :iteration_students

  after_create :set_iteration_days

  private

	# Set up individual days for each iteration
  def set_iteration_days
  	return if self.start == nil || self.end == nil
  	day = self.start
  	while day <= self.end
  		self.iteration_days.create(day: day)
  		day += 1.day
  	end
  end
end
