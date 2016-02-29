class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :sms
      t.string :password_digest
      t.boolean :is_temp_password, default: true
      t.references :avatar_ui, index: true

      t.timestamps null: false
    end
  end
end
