require 'rails_helper'

RSpec.describe CalculateTemperatureService do
  include ActiveSupport::Testing::TimeHelpers

  before do
    allow_any_instance_of(CalculateTemperatureService).to receive(:forecast).and_return(file_data('forecast'))
  end

  describe '.forecast' do
    it 'returns forecast informations' do
      calculate = described_class.new(file_data('forecast'))

      expect(calculate.forecast).to include(:cod, :list, :city)
    end
  end

  describe '.temperature' do
    it 'returns forecast informations' do
      travel_to Date.new(2022,02,06) do
        calculate = described_class.new(file_data('forecast'))

        expect(calculate.temperature).to include("07/02" => 27.3, "08/02" => 27.3, "09/02" => 27.3, "10/02" => 27.4, "11/02" => 27.9)
      end
    end

    it 'returns te correct number of temperatures' do
      travel_to Date.new(2022,02,06) do
        calculate = described_class.new(file_data('forecast'))

        expect(calculate.temperature.size).to eq 5
      end
    end
  end
end
