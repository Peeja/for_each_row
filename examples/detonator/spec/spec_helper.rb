$: << File.dirname(__FILE__) + "/../lib"
$: << File.dirname(__FILE__) + "/../../../lib"

require 'rubygems'
require 'spec'
require 'detonator'
require 'for_each_row'

Spec::Runner.configure do |config|
  config.include ForEachRow
end
