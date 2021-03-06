# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ticketmaster-mantis}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Codenauts}]
  s.date = %q{2011-12-27}
  s.description = %q{This provides an interface with mantis through the ticketmaster gem.}
  s.email = %q{thomas@dohmke.de}
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [
    "README.md"
  ]
  s.homepage = %q{http://github.com/codenauts/ticketmaster-mantis}
  s.licenses = [%q{MIT}]
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{The codebase provider for ticketmaster}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<mantisrb>, [">= 0"])
      s.add_runtime_dependency(%q<ticketmaster>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<mantisrb>, [">= 0"])
      s.add_dependency(%q<ticketmaster>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<mantisrb>, [">= 0"])
    s.add_dependency(%q<ticketmaster>, [">= 0"])
  end
end

