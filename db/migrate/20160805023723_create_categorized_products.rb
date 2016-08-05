class CreateCategorizedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :categorized_products do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps
    end
  end
end
