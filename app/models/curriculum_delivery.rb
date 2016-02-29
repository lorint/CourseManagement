class CurriculumDelivery < ActiveRecord::Base
	belongs_to :curriculum
	belongs_to :taught_by, class_name: "UserRole",
	  foreign_key: :taught_by_id, inverse_of: :deliveries_ur

	has_many :delivery_days
	has_many :delivery_to_students, through: :delivery_days
end
