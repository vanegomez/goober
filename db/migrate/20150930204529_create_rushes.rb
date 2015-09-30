class CreateRushes < ActiveRecord::Migration
  def change
    create_table :rushes do |t|
      t.integer :ride_id
      t.boolean :rush, default: true

      t.timestamps null: false
    end
  end
end
