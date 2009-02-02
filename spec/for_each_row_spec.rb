$: << File.dirname(__FILE__) + "/../lib"

require 'rubygems'
require 'spec'
require 'for_each_row'

describe ForEachRow do
  include ForEachRow
  
  it "should call the block once with each row" do
    should_receive(:called_with).once.with("foo", "bar", "foobar")
    should_receive(:called_with).once.with("baz", "bax", "bazbax")
    
    for_each_row <<-TABLE do |string1, string2, full_string|
                             |foo,     bar,     foobar     |
                             |baz,     bax,     bazbax     |
                    TABLE
      called_with(string1, string2, full_string)
    end
  end
end
