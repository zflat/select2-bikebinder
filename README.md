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

## Basic Usage for Wheel Select


### Include javascript assets

Add the following to your `app/assets/javascripts/application.js`:

	//= require select2
	//= require i18n
	//= require i18n/translations
	//= require wheel_select2

### Run the setup for i18n

	rake i18n:js:setup

### Include select2-rails stylesheet assets

Add to your `app/assets/stylesheets/application.css`:

	*= require select2
	*= require wheel_select

### Add the select element to your view

	<script type="text/javascript">
	I18n.locale = "<%= I18n::locale %>"; //specify locale
	var s1 = new WheelSelectBuilder({id:"e1", multiple:false});  
	var s2 = new WheelSelectBuilder({id:"e2", multiple:true});  
	     
	$(document).ready(
	  function() { 
	     s1.build();
	     s2.build();
	   }
	);
	</script>
		
	<input type="hidden" id="e1" style="width:400px"  />
	<br />
	<input type="hidden" id="e2" style="width:400px" data-placeholder="Select a wheel size" />

# License

See license file.


