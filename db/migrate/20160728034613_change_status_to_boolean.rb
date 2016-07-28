class ChangeStatusToBoolean < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :status, :available
  end
end
