require 'spec_helper'

describe Exemption do

  describe '#included' do
  	context 'when item is from food category' do
  		subject { Exemption.new(Item.new(1, 'imported box of chocolates', 10.00)) }
	    it 'returns true' do
      	expect(subject.included?).to be true
    	end
  	end
   	context 'when item is from medical category' do
  		subject { Exemption.new(Item.new(1, 'packet of headache pills', 9.75)) }
	    it 'returns true' do
      	expect(subject.included?).to be true
    	end
  	end
  	context 'when item is NOT Exemption' do
  		subject { Exemption.new(Item.new(1, 'music cd', 14.99)) }
	    it 'returns false' do
      	expect(subject.included?).to be false
    	end
  	end  
  end

end
