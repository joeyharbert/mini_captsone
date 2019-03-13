class Image < ApplicationRecord
  belongs_to :product
  # def product
  #   return Product.find(product_id)
  # end
end
