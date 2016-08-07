class AddQuantityToCartedProductTable < ActiveRecord::Migration[5.0]
  def change
    add_column :carted_products, :quantity, :integer
    remove_column :orders, :quantity, :integer
  end
end
