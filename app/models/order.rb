class Order < ApplicationRecord
  belongs_to :user
  has_many :cartedproducts
  has_many :products, through: :cartedproducts
end
