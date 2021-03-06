# frozen_string_literal: true

require_relative 'lib/beauty_weather/version'

Gem::Specification.new do |spec|
  spec.name          = 'beauty_weather'
  spec.version       = BeautyWeather::VERSION
  spec.authors       = ['Bruno Toral']
  spec.email         = ['bruno@toral.dev']

  spec.summary       = 'A ruby gem to use OpenWeather API'
  spec.description   = 'A ruby gem to use OpenWeather API. In this version only getting Weather and forecast informations.'
  spec.homepage      = 'https://github.com/brunotoral/'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.4.0'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'httparty'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
