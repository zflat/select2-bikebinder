module Select2BikeBinder
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates a default select2-bikebinder initializer and copy local files to your application'

      def copy_initializer
        copy_file 'select2_bike_binder.rb', 'config/initializers/select2_bike_binder.rb'
      end

    end
  end
end
