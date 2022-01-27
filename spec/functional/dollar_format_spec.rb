require 'spec_helper'

RSpec.describe 'Dollar Format Test' do
  describe 'dollar format' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt')
      }
    end

    it 'parses input files and outputs normalized data' do
      extracted_data = DollarFormat.new(params[:dollar_format]).extract_data()
      # Expected format of each entry: `<first_name>, <city>, <birthdate M/D/YYYY>`
      expect(extracted_data).to eq [
        ["Rhiannon", "Los Angeles", "4/30/1974"],
        ["Rigoberto", "New York City", "1/5/1962"]
      ]
    end
  end
end