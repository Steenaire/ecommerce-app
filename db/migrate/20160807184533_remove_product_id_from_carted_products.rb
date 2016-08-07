class RemoveProductIdFromCartedProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :carted_products, :product_id, :integer
  end
end
