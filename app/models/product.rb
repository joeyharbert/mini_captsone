class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}


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

  def supplier
    return Supplier.find(supplier_id)
  end
end
