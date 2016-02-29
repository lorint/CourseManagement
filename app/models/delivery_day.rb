class DeliveryDay < ActiveRecord::Base
  belongs_to :day, class_name: "IterationDay",
    foreign_key: :iteration_day_id, inverse_of: :delivery_days
  belongs_to :curriculum_delivery

  has_many :delivery_to_students
end
