# encoding: utf-8

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => :spec

begin
  # rake/rdoctask is deprecated in RDoc 2.4.2+
  require 'rdoc/task'
rescue LoadError
  require 'rake/rdoctask'
end

require_relative './lib/select2-bikebinder'

Rake::RDocTask.new do |rdoc|
  version = Select2BikeBinder::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "select2-bikebinder #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

