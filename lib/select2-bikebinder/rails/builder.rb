# -*- coding: utf-8 -*-
require_relative 'select_builder'

module Select2BikeBinder
  module Builder
    
    class WheelDiameterSelect < SelectBuilder
      def default_options
        super.merge({:width=>'400px'})
      end
    end

    class ColorSelect < SelectBuilder
      def default_options
        super.merge({:width=>'200px'})
      end
    end

  end
end
