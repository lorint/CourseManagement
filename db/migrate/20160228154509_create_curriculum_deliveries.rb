class CreateCurriculumDeliveries < ActiveRecord::Migration
  def change
    create_table :curriculum_deliveries do |t|
      t.references :curriculum, index: true, foreign_key: true
      t.references :taught_by, index: true
    end
  end
end
