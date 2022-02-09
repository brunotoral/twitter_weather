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

  it 'raises bad request error' do
    adapter = double(:adapter)
    client = described_class.new adapter: adapter
    fake_response = double(:response, code: 401)

    allow(adapter).to receive(:get).and_return(fake_response)

    expect{ client.get('/foobar') }.to raise_error BeautyWeather::Unauthorized
  end

  it 'raises unavailable error' do
    adapter = double(:adapter)
    client = described_class.new adapter: adapter
    fake_response = double(:response, code: 503)

    allow(adapter).to receive(:get).and_return(fake_response)

    expect{ client.get('/foobar') }.to raise_error BeautyWeather::ServiceUnavailable
  end

  it 'raises bad request error' do
    adapter = double(:adapter)
    client = described_class.new adapter: adapter
    fake_response = double(:response, code: 400)

    allow(adapter).to receive(:get).and_return(fake_response)

    expect{ client.get('/foobar') }.to raise_error BeautyWeather::BadRequest
  end

  it 'raises error' do
    adapter = double(:adapter)
    client = described_class.new adapter: adapter
    fake_response = double(:response, code: 500)

    allow(adapter).to receive(:get).and_return(fake_response)

    expect{ client.get('/foobar') }.to raise_error BeautyWeather::Error
  end
end
