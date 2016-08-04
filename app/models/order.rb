class Order < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :user

  def updated_friendly_time
    updated_at.strftime("%B %e, %Y")
  end
  
end
