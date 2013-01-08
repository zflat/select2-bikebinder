require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'iso_bsd-i18n'
require 'rails/select_builder'
require 'rails/builder'
module Select2BikeBinder
  module Builder
    describe SelectBuilder do

      describe "a generic instance" do
        before :each do
          @id = 'test'
          @b = SelectBuilder.new('test')
        end
        
        it "should have default options" do
          expect(@b.default_options).to_not eq(nil)
        end
        it "should have options" do
          expect(@b.options).to_not eq(nil)
        end
        
        it "should have a default value of multi" do
          expect(@b.multiple).to_not eq(nil)
        end

        it "should have flags" do
          expect(@b.flags).to_not eq(nil)
        end

        it "should have flag multiple" do
          expect(@b.multiple?).to eq(@b.multiple)
        end

        it "should have flag form" do
          expect(@b.form?).to eq(@b.form)
        end

        it "should have flag compact" do
          expect(@b.compact?).to eq(@b.compact)
        end

        it "should have the correct id attribute" do
          expect(@b.id).to eq(@id)
        end

        describe "attribute options" do

          it "should not override existing attributes" do
            fake_id = 'fail'
            @b2 = SelectBuilder.new(@id, :id=>fake_id)
            expect(@b2.id).to eq(@id)
          end
        end
      end
    end # describe SelectBuilder

    describe WheelDiameterSelect do
      describe "a vanilla instance" do
        before :each do
          @w = WheelDiameterSelect.new('test')
        end

        it "should have to_partial_path" do
          expect(@w.to_partial_path).to_not eq(nil)
        end
      end

      describe "instance with width=99999 given" do
        before :each do
          @id = 'test'
          @width = 999
          @w = WheelDiameterSelect.new @id, :width=>999
        end

        it "should have the correct width attribute" do
          expect(@w.width).to eq(@width)
        end
      end
    end
  end # module Builder
end # module Select2BikeBinder
