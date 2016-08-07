class Product < ApplicationRecord
  belongs_to :supplier, optional: true
  has_many :orders
  has_many :images

  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :carted_products
  has_many :orders, through: :carted_products

  accepts_nested_attributes_for :images, :allow_destroy => true

  def sale_message
    if price < 2
      return "Discount item!"
    else
      return "On Sale!"
    end
  end

  def tax
    (price*0.09)
  end

  def total
    (price + self.tax)
  end

  def availability
    puts available
    if available
      return "In-Stock!"
    else
      return "Out of Stock"
    end
  end

  def self.search(search)
    where("lower(name) LIKE ? OR lower(description) ILIKE ?", "%#{search.downcase}%", "%#{search.downcase}%") 
  end

end
