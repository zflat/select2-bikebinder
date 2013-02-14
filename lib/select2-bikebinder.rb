require 'color_name-i18n'
require 'iso_bsd-i18n'

require 'select2-bikebinder/version'
require 'select2-bikebinder/builder/builder'
require 'select2-bikebinder/configuration'

module Select2BikeBinder

  def Select2BikeBinder::init
    I18n.load_path << Dir[File.join(File.expand_path(File.dirname(__FILE__) + '/../locales'), '*.yml')]
    I18n.load_path.flatten!
  end

  if defined?(Rails)
    require 'select2-bikebinder/rails/engine'
  else
    Select2BikeBinder::init
  end

end
