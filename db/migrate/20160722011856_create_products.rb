class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :price
      t.string :description
      t.string :name
      t.string :image
      t.integer :quantity
      t.string :category

      t.timestamps
    end
  end
end
