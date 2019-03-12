class Image < ApplicationRecord
  def product
    return Product.find(product_id)
  end
end
