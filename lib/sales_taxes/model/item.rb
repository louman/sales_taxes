require_relative 'exemption'

class Item

  attr_accessor :quantity, :description, :price, :taxes 
  
  def initialize(quantity, description, price)
    @quantity     = quantity
    @description  = description
    @price        = price
    @taxes        = []
  end

  def exempt?
    Exemption.new(self).included?
  end

  def imported?
    description.include?('imported')
  end

  def price_plus_taxes
    (price + total_taxes)
  end

  def total_taxes
    total = taxes.map(&:value).inject(0, &:+) * quantity
    (total*20).ceil / 20.0
  end

  def print
    "#{quantity}, #{description}, #{sprintf('%.2f', price_plus_taxes)}"
  end

end