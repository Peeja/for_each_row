require File.dirname(__FILE__) + "/spec_helper"

describe Detonator do
  before(:each) do
    @detonator = Detonator.new
  end
  
  it "should not work if the first key hasn't been turned" do
    @detonator.turn_key(2)
    lambda { @detonator.push_big_red_button }.should_not raise_error
  end
  
  it "should not work if the second key hasn't been turned" do
    @detonator.turn_key(1)
    lambda { @detonator.push_big_red_button }.should_not raise_error
  end
  
  it "should not work if both keys have been turned but the safety is still on" do
    @detonator.turn_key(1)
    @detonator.turn_key(2)
    lambda { @detonator.push_big_red_button }.should_not raise_error
  end
  
  it "should work if both keys have been turned and the safety is turned off" do
    @detonator.turn_key(1)
    @detonator.turn_key(2)
    @detonator.turn_off_safety
    lambda { @detonator.push_big_red_button }.should raise_error(Explosion)
  end
end
