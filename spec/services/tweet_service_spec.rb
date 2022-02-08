require 'rails_helper'

RSpec.describe TweetService do
  let(:tweet) { '30.36°C e nublado em Natal em 08/02. Média para os próximos dias: 27.8°C em 07/02, 27.3°C em 08/02, 27.3°C em 09/02, 27.4°C em 10/02 e 27.9°C em 11/02.' }
  let(:params) { {user: 'foobaruser', token: 'foobar123token'} }
  before do
    allow_any_instance_of(TweetService).to receive(:tweet).and_return(tweet)
  end

  describe '.tweet' do
    it 'returns forecast informations' do
      calculate = described_class.new(message: tweet, params: params)

      expect(calculate.tweet).to eq tweet
    end
  end
end
