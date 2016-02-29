class DayCurriculum < ActiveRecord::Base
  belongs_to :day
  belongs_to :curriculum
  belongs_to :taught_by
end
