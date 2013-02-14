module Select2BikeBinder

  # Allow for configuration in the host application
  # See http://robots.thoughtbot.com/post/344833329/mygem-configure-block
  class Configuration
    attr_accessor :color_option_keys
    
    def initialize
      @color_option_keys = ColorNameI18n::keys
    end
  end

  class << self
    attr_accessor :configuration
  end
  
  def self.configure
    self.configuration ||= Configuration.new
    yield(self.configuration)
  end

  def self.reset_configuration
    self.configuration = Configuration.new
  end

end # module Select2BikeBinder
