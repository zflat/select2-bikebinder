# -*- coding: utf-8 -*-
module Select2BikeBinder
  module Builder
    class SelectBuilder

      def default_options
        {
          :multiple => false,
          :compact => false,
          :value => "",
          :width=>nil
        }
      end

      def partial_path_root
        "select2_ui"
      end

      def css_class
        unless @css
          @css = self.class.selector_class
          [:multiple, :compact].each do |flag|
            @css += " #{flag}" if self.send(flag)
          end
        end
        @css
      end

      def css_style
        "width:#{width}" if width
      end

      def initialize(id, optns = {})
        @id = id
        @opt = optns
        mash(options)
      end

      attr_reader :id

      def to_partial_path
        "#{partial_path_root}/#{ActiveSupport::Inflector::underscore(class_name)}"
      end

      def options
        @full_options ||= default_options.merge @opt
        @full_options
      end
      
      def class_name
        self.class.to_s.split('::')[-1]      
      end

      private
      def mash(hash)
        hash.each do |key,value|
          unless self.methods.include? key.to_sym
            var = "@#{key}"
            metaclass = class << self; self; end
            self.instance_variable_set(var, value)
            metaclass.send(:define_method, key.to_sym) do
              self.instance_variable_get(var)
            end
          end
        end
      end #def mash

    end # class SelectBuilder
  end # module Builder
end # module Select2BikeBinder
