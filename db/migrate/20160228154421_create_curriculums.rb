class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :description
      t.references :curriculum_type, index: true, foreign_key: true
      t.references :parent, index: true
      t.references :created_by, index: true

      t.timestamps null: false
    end
  end
end
