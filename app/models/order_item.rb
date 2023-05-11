class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :set_unitprice
  before_save :set_total

  def unitprice
    if persisted?
      self[:unitprice]
    else
      product.price
    end
  end

  def total
    unitprice * quantity
  end

  private

  def set_unitprice
    self[:unitprice] = unitprice 
  end

  def set_total
    self[:total] = total * quantity
  end
end
