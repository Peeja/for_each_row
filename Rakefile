require 'rubygems'

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.warning = true
  end
rescue LoadError
  STDERR.puts "RSpec not found.  Install it to run specs."
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "for_each_row"
    s.summary = s.description = "A method for specifying Fit-esque tables in Ruby"
    s.authors = ["Peter Jaros"]
    s.email = "peter.a.jaros@gmail.com"
  end
rescue LoadError
  STDERR.puts "Jeweler not available. To release, install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
