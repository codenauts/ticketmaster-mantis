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
require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "ticketmaster-mantis"
  gem.homepage = "http://github.com/codenauts/ticketmaster-mantis"
  gem.license = "MIT"
  gem.summary = %Q{The codebase provider for ticketmaster}
  gem.description = %Q{This provides an interface with mantis through the ticketmaster gem.}
  gem.email = "thomas@dohmke.de"
  gem.authors = ["Codenauts"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

