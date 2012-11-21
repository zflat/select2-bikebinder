# Select2-BikeBinder

Library of scripts and styles to assist in adding select2 user interfaces to the bike inventory application.

## Installation

See select2-rails for basics for setup

### Install select2-rails and select2-bikebinder gem

Add `select2-rails` and 'select2-bikebinder' to your Gemfile and run `bundle install`:

	gem "select2-rails"
	gem "select2-bikebinder"


## Basic Usage for Wheel Select


### Include javascript assets

Add the following to your `app/assets/javascripts/application.js`:

	//= require select2
	//= require wheel_select2

### Include select2-rails stylesheet assets

Add to your `app/assets/stylesheets/application.css`:

	*= require select2
	*= require wheel_select

### Add the select element to your view

	<script type="text/javascript">
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


