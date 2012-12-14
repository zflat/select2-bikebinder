require 'rails'
require 'select2-bikebinder/rails/builder'

module Select2BikeBinder
  module Rails
    class Engine < ::Rails::Engine
      Select2BikeBinder::init
    end
  end
end
