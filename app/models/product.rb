class Product < ApplicationRecord
  def is_discounted?
    return true if price < 10
    return false
  end

  def tax
    return (price * 0.09).round(2)
  end

  def total
    return (price + tax).round(2)
  end

  def total_string  #total with trailing zeroes
    return '%.2f' % total
  end
end
