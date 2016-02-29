class User < ActiveRecord::Base
	has_many :user_images
	has_many :images, through: :user_images
  belongs_to :avatar_ui, class_name: "UserImage",
    foreign_key: :avatar_ui_id

  has_many :user_roles
  has_many :roles, through: :user_roles

  has_many :iteration_students, through: :user_roles,
    class_name: "IterationStudent", source: :iteration_students,
    foreign_key: :student_id
  has_many :iterations, through: :iteration_students,
    class_name: "Iteration", foreign_key: :iteration_id
  has_many :iteration_days, through: :iteration_students,
    class_name: "Iteration", foreign_key: :iteration_id
  has_many :received_deliveries, through: :iteration_students,
    class_name: "DeliveryToStudent", foreign_key: :student_iteration_id
  has_many :student_works, through: :received_deliveries,
    class_name: "StudentWork", foreign_key: :delivery_to_student_id

  has_many :created_courses, through: :user_roles, class_name: "Course",
    foreign_key: :created_by_id, source: :courses


  has_secure_password validations: false

  validate :check_password

  def role?(role)
  	return self.user_roles.map(&:role_id).include?(role.id)
  end

  private
  def check_password
  	# For new records, we require a password, so if one isn't provided
  	# then if it's a non-admin we'll make one up, but for an admin they
  	# must have a password in place.

  	# Instructors and admins require phone verification
#  	if self.new_record?

  end
end
