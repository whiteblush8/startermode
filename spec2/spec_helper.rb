# spec/spec_helper.rb
RSpec.configure do |config|
  config.example_status_persistence_file_path = "spec/examples.txt" # Keep track of the test result statuses
  config.disable_monkey_patching!  # Disable RSpec's global monkey-patching
  config.warnings = true # Show warnings if any
  config.profile_examples = 10 # Slowest tests will be shown at the end of the output
end
