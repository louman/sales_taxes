require_relative 'reader/csv_data_reader'
require_relative 'model/order'
require_relative 'business/tax_calculator'

class Input

	def self.process(file_path)
		items = CSVDataReader.read(File.absolute_path(file_path))
		order = Order.new(items)
		TaxCalculator.tax(order)
		order.receipt
	end

end