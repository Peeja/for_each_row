$: << File.dirname(__FILE__) + "/../lib"

require 'rubygems'
require 'spec'
require 'for_each_row'

describe ForEachRow do
  it "should call the block once with each row" do
    block = lambda {}
    block.should_receive(:call).once.with(1, 2, 3)
    block.should_receive(:call).once.with(5, 7, 12)
    
    for_each_row <<-TABLE, &block
                      |1,       2,       3  |
                      |5,       7,       12 |
                    TABLE
  end
end
