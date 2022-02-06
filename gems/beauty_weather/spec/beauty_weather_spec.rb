# frozen_string_literal: true
require 'spec_helper'

RSpec.describe BeautyWeather do
  describe '.configure' do
    it 'saves api key' do
      described_class.configure do |config|
        config.api_key = 'foobar'
      end

      expect(described_class.api_key).to eq 'foobar'
    end

    it 'saves uri' do
      described_class.configure do |config|
        config.uri = 'www.foobar.com'
      end

      expect(described_class.uri).to eq 'www.foobar.com'
    end
  end

  describe '.reset_configuration!' do
    it 'resets all configuration options' do
      described_class.configure do |config|
        config.api_key = 'Foobar'
        config.uri = 'www.foobar.com'
      end

      described_class.reset_configuration!

      expect(described_class.api_key).to eq nil
      expect(described_class.uri).to eq nil
    end
  end

  it 'has a version number' do
    expect(BeautyWeather::VERSION).not_to be nil
  end
end
