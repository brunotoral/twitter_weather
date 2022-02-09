require 'rails_helper'

RSpec.describe ForecastTweetCreatorJob, type: :job do
  let(:params) { { twitter: { user: 'foobaruser', token: 'foobartoken123'}, city_id: '2022'} }

  describe '#perform_later' do
    it 'Creates a twitter' do
      ActiveJob::Base.queue_adapter = :test

      expect {
        ForecastTweetCreatorJob.perform_later(params)
      }.to have_enqueued_job
    end
  end
end
