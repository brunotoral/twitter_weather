# frozen_string_literal: true

require 'spec_helper'
require 'vcr'

RSpec.describe BeautyWeather::Weather do
  before(:all) { VCR.turn_on! }
  after(:all) { VCR.turn_off! }

  it 'returns the correct city id' do
    weather = described_class.new(city_id: '123')

    expect(weather.city_id).to eq '123'
  end

  it 'returns language default value' do
    weather = described_class.new(city_id: '123')

    expect(weather.lang).to eq 'pt_br'
  end

  it 'returns units default value' do
    weather = described_class.new(city_id: '123')

    expect(weather.units).to eq 'metric'
  end

  it 'returns units setted value' do
    weather = described_class.new(city_id: '123', units: 'foobar')

    expect(weather.units).to eq 'foobar'
  end

  it 'returns lang setted value' do
    weather = described_class.new(city_id: '123', lang: 'foobar')

    expect(weather.lang).to eq 'foobar'
  end

  describe '.weather' do
    context 'with valid api key' do
      it 'returns response code 200' do
        BeautyWeather.configure do |config|
          config.api_key = ENV['OPEN_WEATHER_KEY']
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('weather_status_200', record: :once) do
          weather = BeautyWeather.weather(city_id: '3394023')

          expect(weather[:cod]).to eq 200
        end
      end

      it 'returns the correct attributes' do
        BeautyWeather.configure do |config|
          config.api_key = ENV['OPEN_WEATHER_KEY']
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('weather_status_200', record: :once) do
          weather = BeautyWeather.weather(city_id: '3394023')

          expect(weather).to include(:main,:weather, :name)
        end
      end
    end

    context 'with invalid api key' do
      it 'raises unauthorized error' do
        BeautyWeather.configure do |config|
          config.api_key = 'foobarkey123'
          config.uri = ENV['OPEN_WEATHER_URI']
        end

        VCR.use_cassette('weather_status_400', record: :once) do
          expect{ BeautyWeather.weather(city_id: '3394023') }.to raise_error BeautyWeather::Unauthorized
        end
      end
    end
  end
end
