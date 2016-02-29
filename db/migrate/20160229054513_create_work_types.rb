class CreateWorkTypes < ActiveRecord::Migration
  def change
    create_table :work_types do |t|
      t.string :name
      t.text :notes
      t.boolean :is_url, default: false
    end
  end
end
