class Product < ApplicationRecord

  def sale_message
    if price < 2
      return "Discount item!"
    else
      return "On Sale!"
    end
  end

  def tax
    price.to_f*0.09
  end

  def total
    price + self.tax
  end

end
