class Product < ApplicationRecord
  def is_discounted?
    return true if price < 10
    return false
  end

  def tax
    return price * 0.09
  end
end
