$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib/select2-bikebinder'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'

require 'iso_bsd-i18n'
require 'builder/builder'
require 'select2-bikebinder'

Select2BikeBinder.configure {}

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
