require File.dirname(__FILE__) + "/spec_helper"

describe Detonator do
  
  # Note that this table checks more cases than wordy_detonator_spec.rb.
  
  it "should only work if both keys have been turned and the safety is turned off" do
    for_each_row <<-TABLE do |turned_key1, turned_key2, safety_on, explosion|
                             |false,       false,       true,      false    |
                             |true,        false,       true,      false    |
                             |false,       true,        true,      false    |
                             |true,        true,        true,      false    |
                             |false,       false,       false,     false    |
                             |true,        false,       false,     false    |
                             |false,       true,        false,     false    |
                             |true,        true,        false,     true     |
                    TABLE
      detonator = Detonator.new
      
      detonator.turn_key(1) if turned_key1
      detonator.turn_key(2) if turned_key2
      detonator.turn_off_safety unless safety_on
      
      if explosion
        lambda { detonator.push_big_red_button }.should raise_error(Explosion)
      else
        lambda { detonator.push_big_red_button }.should_not raise_error(Explosion)
      end
    end
  end
end
