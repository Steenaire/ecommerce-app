class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
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
    where("lower(name) LIKE ? OR lower(description) ILIKE ? OR lower(category) ILIKE ?", "%#{search.downcase}%", "%#{search.downcase}%", "%#{search.downcase}%") 
  end

end
