class FourthTryChangeAvailableToBoolean < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :available, 'boolean USING CAST(available AS boolean)'
  end
end
