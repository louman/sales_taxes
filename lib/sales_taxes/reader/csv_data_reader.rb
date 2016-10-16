require_relative 'data_reader'

class CSVDataReader < DataReader

	def self.read(file)
		CSV.read(file)
	end	

end