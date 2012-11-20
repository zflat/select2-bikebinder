module Select2BikeBinder
  VERSION = '0.1.0' unless defined?(VERSION)

  module Rails
    require 'select2-bikebinder/rails/engine' if defined?(Rails)
  end
end
