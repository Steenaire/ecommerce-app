class User < ApplicationRecord
  has_secure_password
  has_many :orders

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :password, length: { in: 6..20 }
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

end
