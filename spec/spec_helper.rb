require_relative '../db/config'
require 'rspec'
require 'database_cleaner'

I18n.enforce_available_locales = false
ActiveRecord::Base.logger = nil

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end
end
