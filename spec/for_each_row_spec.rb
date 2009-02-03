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
                             |"foo",   "bar",   "foobar"   |
                             |"baz",   "bax",   "bazbax"   |
                    TABLE
      called_with(string1, string2, full_string)
    end
  end
  
  describe "should interpret" do
    def should_interpret(from, to, some_local=nil)
      should_receive(:called_with) { |value| value.should eql(to) }

      for_each_row <<-TABLE do |value  |
                               |#{from}|
                      TABLE
        called_with(value)
      end
    end
    
    specify "strings"  do should_interpret(%|"foo"|, "foo") end
    specify "integers" do should_interpret(%|5|, 5) end
    specify "floats"   do should_interpret(%|5.0|, 5.0) end
    specify "symbols"  do should_interpret(%|:bar|, :bar) end
    
    specify "local varables"  do should_interpret(%|some_local|, :bar, :bar) end
    specify "self"            do should_interpret(%|self|, self) end
    specify "methods of self" do should_interpret(%|object_id|, self.object_id) end
  end
end
