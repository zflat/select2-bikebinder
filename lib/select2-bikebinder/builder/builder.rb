# -*- coding: utf-8 -*-
require_relative 'select_builder'
require_relative 'color_option'

module Select2BikeBinder
  module DynamicOptnsMix
    def css_class
      unless @css
        @css = super
        @css += " bigdrop"
        @css += " tagging" if tagging?
      end
      @css
    end
    
    def flaggable_optns
      f = [:tagging]
      super.concat(f).uniq
    end
    
    def to_partial_path
      "#{partial_path_root}/hidden_input_select"
    end    
  end # DynamicOptnsMix

  module Builder

    class WheelDiameterSelect < SelectBuilder
      def self.selector_class; "wheel_diameter" end
        
      def default_options
        super.merge({:width=>'400px'})
      end

      def to_partial_path
        "#{partial_path_root}/hidden_input_select"
      end

    end

    class ColorSelect < SelectBuilder
      def self.selector_class; "js-color_sel" end

      def default_options
        super.merge({:width=>'200px'})
      end

      # List of [value,id] pairs to use
      # for building select options
      def optns_list
        @optns_list ||= Select2BikeBinder.configuration.color_option_keys.map do |k| 
          [ColorNameI18n::Color.new(k).name.capitalize, k]
        end
        @optns_list 
      end
    end # class ColorSelect

    class ModelNestedBrandSelect < SelectBuilder
      include DynamicOptnsMix
      class Selector
        def self.[](arg=nil)
          arg ||= :class
          selectors[arg]
        end
        private
        def self.selectors
          {:class =>"js-bike_model_nested_brand_sel",
            :brand_name => "js-bike_brand_name_input",
            :brand_id => "js-bike_brand_id_input",
            :model_name => "js-bike_model_name_input",
            :model_constraint => "js-model_constraint",
            :taginp => "js-taginp"
          }
        end
      end # class Selector

      def css_class
        unless @css
          @css = super
          @css += " bigdrop"
          @css += " tagging" if tagging?
          @css += " #{Selector[:taginp]}" if tagging?
        end
        @css
      end

      def self.selector_class; Selector[:class] end

      def default_options
        super.merge({:width=>'600px', :tagging=>false})
      end
    end # class ModelNestedBrandSelect

    class BrandSelect < SelectBuilder
      include DynamicOptnsMix
      def self.selector_class; "js-bike_brand_sel" end      
      def default_options
        super.merge({:width=>'300px', :tagging=>false})
      end
    end # class Brand Select

    class ModelSelect < SelectBuilder
      include DynamicOptnsMix
      def self.selector_class; "js-bike_model_sel" end      
      def default_options
        super.merge({:width=>'300px', :tagging=>false})
      end
    end # class Brand Select

  end # module Builder


end # module Select2BikeBinder
