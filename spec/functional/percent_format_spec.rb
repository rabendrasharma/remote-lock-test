require 'spec_helper'

RSpec.describe 'Percent Format Test' do
  describe 'percent format' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_percent.txt')
      }
    end

    it 'parses input files and outputs normalized data' do
      extracted_data = PercentFormat.new(params[:dollar_format]).extract_data()
      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(extracted_data).to eq [
        ["Mckayla", "Atlanta", "5/29/1986"],
        ["Elliot", "New York City", "5/4/1947"]
      ]
    end
  end
end