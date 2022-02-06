# frozen_string_literal: true

require 'spec_helper'
require 'vcr'

RSpec.describe BeautyWeather::Forecast do
  before(:all) { VCR.turn_on! }
  after(:all) { VCR.turn_off! }

  it 'returns the correct city id' do
    forecast = described_class.new(city_id: '2022')

    expect(forecast.city_id).to eq '2022'
  end

  it 'returns language default value' do
    forecast = described_class.new(city_id: '2022')

    expect(forecast.lang).to eq 'pt_br'
  end

  it 'returns units default value' do
    forecast = described_class.new(city_id: '2022')

    expect(forecast.units).to eq 'metric'
  end

  it 'returns units setted value' do
    forecast = described_class.new(city_id: '2022', units: 'foobar')

    expect(forecast.units).to eq 'foobar'
  end

  it 'returns lang setted value' do
    forecast = described_class.new(city_id: '2022', lang: 'foobar')

    expect(forecast.lang).to eq 'foobar'
  end

  describe '.forecast' do
    context 'with valid api key' do
      it 'returns response code 200' do
        BeautyWeather.configure do |config|
          config.api_key = ENV['OPEN_WEATHER_KEY']
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('forecast_status_200', record: :once) do
          forecast = BeautyWeather.forecast(city_id: '3394023')

          expect(forecast[:cod]).to eq '200'
        end
      end

      it 'returns the correct attributes' do
        BeautyWeather.configure do |config|
          config.api_key = ENV['OPEN_WEATHER_KEY']
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('forecast_status_200', record: :once) do
          forecast = BeautyWeather.forecast(city_id: '3394023')

          expect(forecast).to include(:list, :city)
        end
      end
    end

    context 'with invalid api key' do
      it 'raises unauthorized error' do
        BeautyWeather.configure do |config|
          config.api_key = 'foobarkey123'
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('forecast_status_400', record: :once) do
          expect{ BeautyWeather.forecast(city_id: '3394023') }.to raise_error BeautyWeather::Unauthorized
        end
      end
    end
  end
end
