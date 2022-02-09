require 'rails_helper'

RSpec.describe RenderTweetService do
  include ActiveSupport::Testing::TimeHelpers

  let(:temperatures) { { "07/02" => 27.8, "08/02" => 27.3, "09/02" => 27.3, "10/02" => 27.4, "11/02" => 27.9 } }

  before do
    allow_any_instance_of(RenderTweetService).to receive(:current).and_return(file_data('weather'))
    allow_any_instance_of(RenderTweetService).to receive(:temps).and_return(temperatures)
  end

  describe '.temps' do
    it 'returns forecast informations' do
      render = described_class.new(temps: file_data('forecast'), current: file_data('weather'))

      expect(render.temps).to eq temperatures
    end
  end

  describe '.current' do
    it 'returns forecast informations' do
      render = described_class.new(temps: file_data('forecast'), current: file_data('weather'))

      expect(render.current).to eq file_data('weather')
    end
  end

  describe '.composed_message' do
    it 'returns forecast informations' do
       travel_to Date.new(2022,02,06) do
        render = described_class.new(temps: temperatures, current: file_data('weather'))

        expect(render.composed_message).to eq '30.36°C e nublado em Natal em 06/02. Média para os próximos dias: 27.8°C em 07/02, 27.3°C em 08/02, 27.3°C em 09/02, 27.4°C em 10/02 e 27.9°C em 11/02.'
      end
    end
  end
end
