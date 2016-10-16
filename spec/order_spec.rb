require 'spec_helper'

describe Order do

  describe 'orders result' do
    item1 = Item.new(1, 'imported box of chocolates', 10.00)
    item2 = Item.new(1, 'imported bottle of perfume', 47.50)
    order = Order.new([item1, item2])
    TaxCalculator.tax(order)
    it 'shows the total amount of taxes' do
      expect(order.sales_taxes).to eq(7.65)
    end
    it 'shows the total price' do
      expect(order.total).to eq(65.15)
    end
  end

end
