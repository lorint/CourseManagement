class CreateCurriculumTypes < ActiveRecord::Migration
  def change
    create_table :curriculum_types do |t|
      t.string :name
      t.boolean :is_teachable, default: false
      t.boolean :is_workable, default: false
    end
  end
end
