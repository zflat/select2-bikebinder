# -*- coding: utf-8 -*-
module Select2BikeBinder
  module Builder
    class SelectBuilder

      def default_options
        {
          :multiple => false,
          :compact => false,
          :disable => false,
          :value => "",
          :width=>nil,
          :form =>nil,
          :param_key => nil,
        }
      end

      def partial_path_root
        "select2_ui"
      end

      def css_class
        unless @css
          @css = self.class.selector_class
            flags_for_css_classes.each do |flag|
            @css += " #{flag}" if self.send(flag)
          end
        end
        @css
      end

      def css_style
        "width:#{width}" if width
      end

      def initialize(scope, optns = {})
        @opt = optns
        init_scope(scope)
        mash(options)
        init_flags(flaggable_optns)
      end
      
      attr_reader :flags

      def to_partial_path
        "#{partial_path_root}/#{ActiveSupport::Inflector::underscore(class_name)}"
      end
      
#      def select
#        (form?) ? @form.select : select_tag
#      end

      def options
        @full_options ||= default_options.merge @opt
        @full_options
      end

      private
      
      def class_name
        self.class.to_s.split('::')[-1]      
      end
      
      # List of options that can be
      # checked for true/false
      def flaggable_optns
        f = [:form]
        (flags_for_css_classes.concat(f)).uniq
      end
      
      # List of flags that can be specified
      # in the css_class
      # 
      def flags_for_css_classes
        [:multiple, :compact, :disable]
      end
      
      def init_scope(scope)
        if scope.respond_to?(:select)
          @form = scope
        elsif scope.respond_to?(:to_s)
          @id = scope.to_s
        end
        @opt.merge!({:form=>@form,:id=>@id})
      end
    
      # Creates val? methods for each val in flags
      #
      # @param flags Array of vals
      #
      def init_flags(flags)
        @flags ||= []
        @flags << flags
        metaclass = (class << self; self; end)

        flags.each do |attr|
          m_name = "#{attr}?".to_sym
          unless self.methods.include? m_name
            metaclass.send(:define_method, m_name) do
              self.send(attr.to_sym)
            end
          end # mthods.include? m_name
        end #flags.each
      end # init_flags

      def mash(hash)
        hash.each do |key,value|
          unless self.methods.include? key.to_sym
            var = "@#{key}"
            self.instance_variable_set(var, value)
            metaclass = (class << self; self; end)
            metaclass.send(:define_method, key.to_sym) do
              self.instance_variable_get(var)
            end
          end
        end

      end #def mash

    end # class SelectBuilder
  end # module Builder
end # module Select2BikeBinder
