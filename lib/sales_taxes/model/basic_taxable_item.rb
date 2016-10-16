require_relative 'taxable_item'

class BasicTaxableItem < TaxableItem
  def rate
    0.1
  end

  def applicable?
    !@item.exempt?
  end
end