# Select2-BikeBinder

Library of scripts and styles to assist in adding select2 user interfaces to the bike inventory application.

## Installation

See select2-rails for basics for setup

### Install select2-rails and select2-bikebinder gem

Add `select2-rails` and 'select2-bikebinder' to your Gemfile

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

## Basic Usage 


### Run the setup for i18n

	rake i18n:js:setup

### Include javascript assets

Add the following to your `app/assets/javascripts/application.js`:

	//= require select2
	//= require i18n
	//= require i18n/translations
	//= require select2_builder
	//
	// scripts for each select2 interface element
	//= require wheel_select

### Include select2-rails stylesheet assets

Add to your `app/assets/stylesheets/application.css`:

	*= require select2
	*= require wheel_select

### Add the select element to your view

	<script type="text/javascript">
	I18n.locale = "<%= I18n::locale %>"; //specify locale
	     
	$(document).ready(
	  function() { 
	     select_init(WheelSelectBuilder, 
	     {selector:"<%="*.#{Select2BikeBinder::Builder::WheelDiameterSelect.selector_class}"%>"});
	   }
	);
	
	</script>
	
	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e2b', :multiple=>true, :value=>"622,559,630") %>

	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e1b', :value=>'591') %>

	<%=  render Select2BikeBinder::Builder::WheelDiameterSelect.new('e3b', :width=>'200px', :multiple=>true, :compact=>true) %>


# License

See license file.


