module Select2BikeBinder
  VERSION = '0.1.0'

  module Rails
    require 'select2-bikebinder/rails/engine' if defined?(Rails)
  end
end
