class FixProductIdInCategorizedProductsTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :categorized_products, :product_id, :string
    add_column :categorized_products, :product_id, :integer
  end
end
