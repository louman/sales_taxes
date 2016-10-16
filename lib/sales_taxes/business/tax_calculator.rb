require_relative '../model/basic_taxable_item'
require_relative '../model/imported_taxable_item'

class TaxCalculator
# This class apply the rates to the given order

  CHAIN_OF_TAXES = [BasicTaxableItem, ImportedTaxableItem]

  def self.tax(order)
    order.items.each do |item|
      CHAIN_OF_TAXES.each {|tax| tax.new(item) }
    end
  end
  
end