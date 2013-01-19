require 'select2-bikebinder/version'
require 'select2-bikebinder/builder/builder'

module Select2BikeBinder

  def Select2BikeBinder::init
    I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../locales'), '*.yml')]
    I18n.load_path.flatten!
  end

  module Rails
    if defined?(Rails)
      require 'select2-bikebinder/rails/engine'
    else
      Select2BikeBinder::init
    end
  end
end
