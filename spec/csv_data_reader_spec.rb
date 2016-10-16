require 'spec_helper'

describe CSVDataReader do
  
  describe '#read' do
    it 'returns an array from given CSV' do
      expect(CSVDataReader.read(File.absolute_path('input_files/input_1.csv'))).to be_an(Array)
    end

    it 'returns 5-sized Array from given CSV' do
      expect(CSVDataReader.read(File.absolute_path('input_files/input_3.csv')).size).to eq(5)
    end
  end

end
