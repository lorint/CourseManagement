class CreateDeliveryDays < ActiveRecord::Migration
  def change
    create_table :delivery_days do |t|
      t.references :iteration_day, index: true, foreign_key: true
      t.references :curriculum_delivery, index: true, foreign_key: true
      t.text :notes

      t.timestamps null: false
    end
  end
end
