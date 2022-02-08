require 'rails_helper'

RSpec.describe Api::V1::TweetsController, type: :request do
  let(:invalid_params) { { twitter: { user: 'foobaruser', token: 'foobar123token' }, city_id: '' } }
  let(:params) { { twitter: { user: 'foobaruser', token: 'foobar123token' }, city_id: 'foobarcity' } }

  describe 'POST /api/v1/tweets' do
    context 'with valid params' do
      it 'returns status created' do
        post api_v1_tweets_path(params)

        expect(response).to have_http_status :created
      end

      it 'enqueue a job' do
        ActiveJob::Base.queue_adapter = :test

        expect {
          post api_v1_tweets_path(params)
        }.to have_enqueued_job
      end
    end

    context 'with invalid params' do
      it 'returns status unprocessable entity' do
        post api_v1_tweets_path(invalid_params)

        expect(response).to have_http_status :unprocessable_entity
      end

      it 'do not enqueue a job' do
        ActiveJob::Base.queue_adapter = :test
        post api_v1_tweets_path(invalid_params)

        assert_no_enqueued_jobs { ForecastTweetCreatorJob }
      end
    end
  end
end
