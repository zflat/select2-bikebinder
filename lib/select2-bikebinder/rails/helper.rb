module ApplicationHelper

  def render_with(method_name, options={}, &block)
    arrName = method_name.split('::')
    namespace = arrName[0..-2].inject{|memo, s| memo+="::#{s}"} 
    name = arrName[-1]

    obj = (namespace.constantize unless namespace.nil?) || Object
    obj.send(name, self, options, &block)
  end

end

module Select2BikeBinder

  module ViewHelper

    def self.wheel_select(obj, options = {}, &block)
      concat_partial(obj, 'select2_ui/wheel_size', 
                     merge_default_options(options), &block)
    end

    def self.color_select(obj, options = {}, &block)
      concat_partial(obj, 'select2_ui/color', 
                     merge_default_options(options), &block)
    end

    private

    def self.merge_default_options(optns)
      optns[:multiple] ||= false
      optns[:init_val] ||=''
      optns[:width] ||='400px'
      optns
    end

    # Only need this helper once, it will provide an interface to convert a block into a partial.
    # 1. Capture is a Rails helper which will 'capture' the output of a block into a variable
    # 2. Merge the 'body' variable into our options hash
    # 3. Render the partial with the given options hash. Just like calling the partial directly.
    #
    # http://errtheblog.com/posts/11-block-to-partial
    # http://www.igvita.com/2007/03/15/block-helpers-and-dry-views-in-rails/
    # https://github.com/mikestone/Easy-Partials/blob/master/easy_partials.rb
    #
    def self.concat_partial(action_view, partial_name, options = {}, &block)
      unless block.nil?
        options.merge! :body => capture(&block)
      end

      content = action_view.render :partial => partial_name, :locals => options
      action_view.concat content
      nil
    end

  end

end
