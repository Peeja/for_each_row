$: << File.dirname(__FILE__) + "/../lib"

require 'rubygems'
require 'spec'
require 'for_each_row'

describe ForEachRow do
  include ForEachRow
  
  it "should call the block once with each row" do
    should_receive(:called_with).once.with(1, 2, 3)
    should_receive(:called_with).once.with(5, 7, 12)
    
    for_each_row <<-TABLE do |number1, number2, sum|
                             |1,       2,       3  |
                             |5,       7,       12 |
                    TABLE
      called_with(number1, number2, sum)
    end
  end
end
