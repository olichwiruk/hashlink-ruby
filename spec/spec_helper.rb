LIB_PATH = (Pathname(__FILE__) + Pathname('..')).dirname
SPEC_PATH = File.join(LIB_PATH, 'spec')

# This is temporary until directory structure will be properly established
$LOAD_PATH.unshift(LIB_PATH)

RSpec.configure do |conf|
  conf.disable_monkey_patching!
  conf.warnings = true

  conf.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
