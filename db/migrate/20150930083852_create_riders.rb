class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
