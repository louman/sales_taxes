require 'spec_helper'

describe Item do

  describe '#exempt' do
  	context 'when item is free from taxes' do
  		subject { Item.new(1, 'imported box of chocolates', 10.00) }
	    it 'returns true' do
      	expect(subject.exempt?).to be true
    	end
  	end
    context 'when item is not free from taxes' do
      subject { Item.new(1, 'music cd', 10.00) }
      it 'returns false' do
        expect(subject.exempt?).to be false
      end
    end
  end

  describe '#price_plus_taxes' do
    context 'when item costs $10 and has basic taxes' do
      item = Item.new(1, 'imported box of chocolates', 10.00)
      BasicTaxableItem.new(item)
      it 'returns $11.0' do
        expect(item.price_plus_taxes).to eq(11.0)
      end
    end

    context 'when item costs $11.25 and has imported taxes' do
      item = Item.new(1, 'box of imported chocolates', 11.25)
      ImportedTaxableItem.new(item)
      it 'returns $11.85' do
        expect(item.price_plus_taxes).to eq(11.85)
      end
    end
  end

end
