# Select2-BikeBinder

Library of scripts and styles to assist in adding select2 user interfaces to the bike inventory application.

## Installation

See select2-rails for basics for setup

### Install select2-rails and select2-bikebinder gem

Add 'select2-rails', 'select2-bikebinder' and additional asset dependencies to your application Gemfile

	gem "jquery-rails"
	gem "jquery-ui-rails"
	gem "i18n-js"
	gem "select2-rails"
	gem "select2-bikebinder"
   	
#### To use a local select2-bikebinder repository

Clone the select2-bikebinder repository and specify a local path in the Gemfile

	# specify a local path to the gem
	gem "select2-bikebinder", :path => "/path/to/repo/select2-bikebinder"

#### Installation using bundler

	bundle install

#### To build from source and install without bundler

Clone the select2-bikebinder repository, build then install

	cd /path/to/repo/select2-bikebinder
	gem build select2-bikebinder.gemspec
	gem install select2-bikebinder-VER.gem

## Setup

### Run the installation generator

	rails g select2_bike_binder:install

### Run the setup for i18n

	rake i18n:js:setup

### Include javascript assets

Add the following to your `app/assets/javascripts/application.js`:

	//= require select2
	//= require i18n
	//= require 'jquery'
	//= require 'jquery.ui.all'
	//= require i18n/translations
	//= require select2/select2_builder
	//
	// scripts for each select2 interface element
	//= require select2/wheel_select
	//= require select2/color_select
        //= require select2/bike_model_brand_select

### Include select2-rails stylesheet assets

Add to your `app/assets/stylesheets/application.css`:

	*= require select2
	*= require jquery.ui.all
	*= require select2/wheel_select
	*= require select2/color_select

## Basic Usage 

### Classes and methods

    # examples of CSS selectors for form elements
    css_selector = "*.#{Select2BikeBinder::Builder::WheelDiameterSelect.selector_class}"%>",    
    css_class = Select2BikeBinder::Builder::ModelNestedBrandSelect.selector_class
    brand_name ="*.#{Select2BikeBinder::Builder::ModelNestedBrandSelect::Selector[:brand_name]}"
    brand_id ="*.#{Select2BikeBinder::Builder::ModelNestedBrandSelect::Selector[:brand_id]}"

### Add the select element to your view

	<script type="text/javascript">
	I18n.locale = "<%= I18n::locale %>"; //specify locale
	     
	$(document).ready(
	  function() { 
	     select_init(sel2.WheelSelectBuilder)

	     select_init(sel2.ColorSelectBuilder)

             select_init(sel2.ModelNestedBrandSelectBuilder, 
             {optns:{api_url:"<%= bike_mfg_queries_url %>",
	     brand_api_url: "<%= brand_queries_url %>",
	     model_api_url: "<%= model_queries_url %>",
	     }});

             select_init(sel2.BrandSelectBuilder, 
             {optns:{api_url:"<%= search_brands_url %>"}});

             select_init(sel2.ModelSelectBuilder, 
             {optns:{api_url:"<%= search_models_url %>"}});
	   }
	);}
	
	</script>

        <h1>Examples</h1>
        <h2>Stand-alone selects</h2>
        <%=  render Select2BikeBinder::Builder::ModelNestedBrandSelect.new('me2b') %>
	
	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e2b', :multiple=>true, :value=>"622,559,630") %>

	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e1b', :value=>'591') %>

	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e3b', :width=>'200px', :multiple=>true, :compact=>true) %>

	<%= render Select2BikeBinder::Builder::BrandSelect.new('me2b' ) %>
	
	<%= render Select2BikeBinder::Builder::ModelSelect.new('b234' ) %>

        <%=  render Select2BikeBinder::Builder::ColorSelect.new( 's5c', :multiple=>true, :compact=>false) %>

        <h2>Form-builder selects</h2>

	<%= form_for(@obj, :url => root_path) do |f| %>	
	 <%= f.label :color, "Color" %>
	 <% color_optns = {:multiple=>false, :param_key => 'color', :value=>bike.color.key} %>
	 <%= render Select2BikeBinder::Builder::ColorSelect.new f, color_optns %>

	 <%= f.label :wheel_size, "Wheel Size" %>
	 <%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new(f,
	 :param_key=>'wheel_size', :multiple=>false, :value=>bike.wheel_size, :width=>"90%") %>

	 <div style="border:1px solid #333">
	 <%= render :partial=>'select2_ui/brand_model_lookup_create', :locals =>{:form_builder =>f} %>  
	 </div>
       <% end %>



# License

See license file.


