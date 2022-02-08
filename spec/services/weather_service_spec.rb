require 'rails_helper'

RSpec.describe WeatherService do
  before do
    allow_any_instance_of(WeatherService).to receive(:fetch_weather_information).and_return(file_data('weather'))
    allow_any_instance_of(WeatherService).to receive(:fetch_forecast_information).and_return(file_data('forecast'))
  end

  describe '.city_id' do
    it 'returns te correct city_id' do
      weather_service = described_class.new('2022')

      expect(weather_service.city_id).to eq '2022'
    end
  end

  describe '.current' do
    it 'returns weather information' do
      weather_service = described_class.new('2022')

      expect(weather_service.current).to include(:main, :weather, :name, :cod)
    end
  end

  describe '.forecast' do
    it 'returns forecast information' do
      weather_service = described_class.new('2022')

      expect(weather_service.forecast).to include(:cod, :list, :city)
    end
  end
end
