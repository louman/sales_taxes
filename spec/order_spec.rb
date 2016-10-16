require 'spec_helper'

describe Order do

  describe 'orders result for purchase 1' do
    item1 = Item.new(1, 'book', 12.49)
    item2 = Item.new(1, 'music cd', 14.99)
    item3 = Item.new(1, 'chocolate bar', 0.85)
    order = Order.new([item1, item2, item3])
    TaxCalculator.tax(order)

    it 'shows $1.50 for the amount of taxes' do
      expect(order.sales_taxes).to eq('1.50')
    end
    it 'shows the total price' do
      expect(order.total).to eq('29.83')
    end
  end

  describe 'orders result for purchase 2' do
    item1 = Item.new(1, 'imported box of chocolates', 10.00)
    item2 = Item.new(1, 'imported bottle of perfume', 47.50)
    order = Order.new([item1, item2])
    TaxCalculator.tax(order)

    it 'shows the total amount of taxes' do
      expect(order.sales_taxes).to eq('7.65')
    end
    it 'shows the total price' do
      expect(order.total).to eq('65.15')
    end
  end

  describe 'orders result for purchase 3' do
    item1 = Item.new(1, 'imported bottle of perfume', 27.99)
    item2 = Item.new(1, 'bottle of perfume', 18.99)
    item3 = Item.new(1, 'packet of headache pills', 9.75)
    item4 = Item.new(1, 'box of imported chocolates', 11.25)

    order = Order.new([item1, item2, item3, item4])
    TaxCalculator.tax(order)

    it 'shows the total amount of taxes' do
      expect(order.sales_taxes).to eq('6.70')
    end
    it 'shows the total price' do
      expect(order.total).to eq('74.68')
    end
  end
end
