class AddRoleToRiders < ActiveRecord::Migration
  def change
    add_column :riders, :role, :integer, default: 0
  end
end
