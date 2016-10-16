require_relative 'taxable_item'

class ImportedTaxableItem < TaxableItem
  def rate
    0.05
  end

  def applicable?
    item.imported?
  end
end