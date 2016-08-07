class Order < ApplicationRecord
  belongs_to :user

  has_many :carted_products
  has_many :products, through: :carted_products

  def updated_friendly_time
    updated_at.strftime("%B %e, %Y")
  end
  
end
