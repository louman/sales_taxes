class Tax
  
  attr_accessor :description, :value
  
  def initialize(description, value)
    @description = description
    @value = value
  end
  
end