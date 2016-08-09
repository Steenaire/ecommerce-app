class CartedProduct < ApplicationRecord

  belongs_to :order
  belongs_to :product

  validate :quantity_must_be_less_than_stock

  def quantity_must_be_less_than_stock
    if quantity && (quantity > self.product.quantity)
      errors.add(:quantity, "Not enough product in stock")
    end
  end

end
