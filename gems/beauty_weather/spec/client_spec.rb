# frozen_string_literal: true

require 'spec_helper'

RSpec.describe BeautyWeather::Client do
  it 'returns the default adapter' do
    client = described_class.new

    expect(client.adapter).to eq HTTParty
  end

  it 'returns the default uri' do
    BeautyWeather.configure do |config|
      config.api_key = 'foobarapikey123'
      config.uri = 'www.foobar.com'
    end

    client = described_class.new

    expect(client.uri).to eq 'www.foobar.com'
  end
end
