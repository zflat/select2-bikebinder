require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module Select2BikeBinder

  describe "configuration" do
    after :each do
      Select2BikeBinder.reset_configuration
    end
    
    it "should have default color_option_keys" do
      expect(Select2BikeBinder.configuration.color_option_keys).to_not be_nil
      expect(Select2BikeBinder.configuration.color_option_keys).to_not be_empty
    end

    it "should allow a different list of color keys to be specified" do
      Select2BikeBinder.configure do |config|
        config.color_option_keys = []
      end
      expect(Select2BikeBinder.configuration.color_option_keys).to be_empty
    end

    it "should be resettable" do
      Select2BikeBinder.configure do |config|
        config.color_option_keys = []
      end
      expect(Select2BikeBinder.configuration.color_option_keys).to be_empty
      Select2BikeBinder.reset_configuration
      expect(Select2BikeBinder.configuration.color_option_keys).to_not be_empty
    end

    
  end
end
