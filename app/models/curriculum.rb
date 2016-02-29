class Curriculum < ActiveRecord::Base
  belongs_to :parent, class_name: "Curriculum",
    foreign_key: :parent_id, inverse_of: :children
  has_many :children, class_name: "Curriculum",
    foreign_key: :parent_id, inverse_of: :parent
  belongs_to :type, class_name: "CurriculumType",
    foreign_key: :curriculum_type_id, inverse_of: :curriculums

  has_many :day_curriculums
  has_many :curriculum_deliveries
end
