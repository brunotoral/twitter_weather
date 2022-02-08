class TweetService
  def initialize(message:,params:)
    @user = params[:user]
    @token = params[:token]
    @message = message
  end

  def tweet
    client.update(message)
  end

  private

  attr_reader :user, :token, :message

  def client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = user
      config.access_token_secret = token
    end
  end
end
