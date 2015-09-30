class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.references :rider, index: true, foreign_key: true
      t.references :driver, index: true, foreign_key: true
      t.integer :status, default: 0
      t.string :pickup
      t.string :dropoff
      t.integer :passenger_number
      t.datetime :requested_time
      t.datetime :accepted_time
      t.datetime :pickup_time
      t.datetime :dropoff_time

      t.timestamps null: false
    end
  end
end
