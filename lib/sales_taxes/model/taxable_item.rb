require_relative 'tax'

class TaxableItem

  attr_reader :item

  def initialize(item)
    @item = item
    @item.taxes << Tax.new(self.class.name, @item.price * rate)   
  end

end