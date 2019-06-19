require 'simplecov'
SimpleCov.start

require_relative '../kart'
require 'factory_bot'

RSPEC_ROOT = File.dirname __FILE__

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # This setting enables warnings. It's recommended, but in some cases may
  # be too noisy due to issues in dependencies.
  config.warnings = true

  config.default_formatter = 'doc' if config.files_to_run.one?

  config.before(:suite) do
    FactoryBot.find_definitions
  end
end
