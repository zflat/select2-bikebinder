require 'rails'

module Select2BikeBinder
  module Rails
    class Engine < ::Rails::Engine
      Select2BikeBinder::init
    end
  end
end
