# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{for_each_row}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Jaros"]
  s.date = %q{2009-02-03}
  s.description = %q{A method for specifying Fit-esque tables in Ruby}
  s.email = %q{peter.a.jaros@gmail.com}
  s.files = ["Readme.markdown", "VERSION.yml", "lib/for_each_row.rb", "spec/for_each_row_spec.rb", "spec/spec.opts"]
  s.has_rdoc = true
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A method for specifying Fit-esque tables in Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
