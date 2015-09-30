class ChangePhoneTypeToBigInteger < ActiveRecord::Migration
  def change
    change_column :riders, :phone, :bigint
    change_column :drivers, :phone, :bigint
  end
end
