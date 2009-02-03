require 'rubygems'

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.warning = true
  end
rescue LoadError
  STDERR.puts "RSpec not found.  Install it to run specs."
end
