require "bundler/setup"
require "parsing_articles"
require "vcr"
VCR.configure do |config|
  # Указываем где будем хранить наши кассеты )
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  # Интегрируемся с webmock 
  config.hook_into :webmock # or :fakeweb
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end


