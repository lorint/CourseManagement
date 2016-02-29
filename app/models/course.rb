class Course < ActiveRecord::Base
  belongs_to :created_by

  has_many :iterations, class_name: "CourseIteration",
    foreign_key: :course_id, inverse_of: :course

  def to_s
  	result = self.name
  	# num_days = ActiveRecord::Base.connection.execute(
  	# 	"SELECT ci.start, COUNT(less) AS taught AS instructor FROM course_iterations")
  	# " #{} days in"
  	result
  end
end
