require_relative 'item'

class Order
  attr_reader :items
  
  def initialize(items)
    @items = items and return if items.first.is_a? Item
    items.shift
    @items = items.map do |item|
      Item.new(
        item[0].strip.to_i, 
        item[1].strip, 
        item[2].strip.to_f)
    end
  end

  def receipt
    items.each {|item| puts item.print }      
    puts "Sales Taxes: #{sales_taxes}"
    puts "Total: #{total}"
  end

  def sales_taxes
    sum_items :total_taxes
  end

  def total
    sum_items :price_plus_taxes
  end

  private
  def sum_items(field)
    sum = items.map(&field).inject(0, &:+)
    sprintf('%.2f', sum)
  end
end