# frozen_string_literal: true

require 'beauty_weather'
require 'vcr'
require 'byebug'
require 'webmock/rspec'

gem_root = Pathname.new(File.realpath('../..', __FILE__))
Dir[gem_root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

WebMock.allow_net_connect!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
