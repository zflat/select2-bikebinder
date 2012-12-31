# -*- coding: utf-8 -*-
require_relative 'select_builder'

module Select2BikeBinder
  module Builder

    class WheelDiameterSelect < SelectBuilder
      def self.selector_class; "wheel_diameter" end
        
      def default_options
        super.merge({:width=>'400px'})
      end
    end

    class ColorSelect < SelectBuilder
      def self.selector_class; "color_sel" end

      def default_options
        super.merge({:width=>'200px'})
      end

      # List of [value,id] pairs to use
      # for building select options
      def optns_list
        ColorNameI18n::keys.map do |k| 
          [ColorNameI18n::Color.new(k).name.capitalize, k]
        end
      end
    end

    class ModelNestedBrandSelect < SelectBuilder
      def self.selector_class; "bike_model_nested_brand_sel" end

      def default_options
        super.merge({:width=>'600px'})
      end

      def css_class
        unless @css
          @css = super
          @css += " bigdrop"
        end
        @css
      end
    end

  end
end
