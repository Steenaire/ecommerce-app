class PutBackProductIdInCartedProductsAndRemoveFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :product_id, :integer
    add_column :carted_products, :product_id, :integer
  end
end
