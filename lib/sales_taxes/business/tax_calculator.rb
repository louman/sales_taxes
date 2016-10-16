require_relative '../model/basic_taxable_item'
require_relative '../model/imported_taxable_item'

class TaxCalculator
# This class apply the rates to the given order

	def self.tax(order)
		order.items.each do |item|
			ImportedTaxableItem.new(item) if item.imported? 
			next if item.exempt?
			BasicTaxableItem.new(item)
		end
	end
	
end