module Select2BikeBinder
  module Builder
    class ColorOption
      attr_reader :color
      
      def initialize(color)
        @color = color if color.respond_to?(:key)
        @color ||= ColorNameI18n::Color.new(color)
      end

      def to_partial_path
        "select2_ui/color_option"
      end    
    end
  end
end
