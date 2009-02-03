`for_each_row`: Tables for your specs
=====================================

This gem provides a single method, `#for_each_row`, which lets you run a block with the values from a table.  It's ideal for specs or tests (though in theory it could be used for anything).  It looks like this:

    for_each_row <<-TABLE do |number1, number2, sum|
                             |1,       2,       3  |
                             |5,       7,       12 |
                    TABLE
      (number2 + number2).should == sum
    end

Getting it
----------

First, install the gem

    sudo gem install Peeja-for_each_row -s http://gems.github.com"

Then include the module in your spec or test environment.  For RSpec, this looks like:

    Spec::Runner.configure do |config|
      config.include ForEachRow
    end

I'm not sure what the official way to do this in Test::Unit is, since I don't use it, but you'll figure it out.  You're a smart one, you.


Example
-------

A good spec is not written to be read by Ruby.  A good spec is written to be read by people.  Specs are not merely tests; they are a tool for communicating with other developers.  A good test exercises the full behavior of an object.  A good spec also explains the behavior.

Sometimes, though, a spec has to get wordy to be complete.  For instance, let's say we're spec'ing a bomb detonator.  The detonator has two keys which need to be turned and a safety which needs to be turned off for the big red button to function.  The spec looks something like this (full spec in `examples/detonator`):

    describe Detonator do
      before(:each) do
        @detonator = Detonator.new
      end
  
      it "should not work if the first key hasn't been turned" do
        @detonator.turn_key(2)
        lambda { @detonator.push_big_red_button }.should_not raise_error
      end
      
      # ...
  
      it "should work if both keys have been turned and the safety is turned off" do
        @detonator.turn_key(1)
        @detonator.turn_key(2)
        @detonator.turn_off_safety
        lambda { @detonator.push_big_red_button }.should raise_error(Explosion)
      end
    end

We're doing the same thing over and over again.  It would be nice to be able to express all of this in a single table, where each row describes a case.  That's what `for_each_row` is for.  Here's the same thing, using `for_each_row`:

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


"So this is always more readable than writing out the cases?"
-------------------------------------------------------------

Almost certainly not.  This isn't math, this is writing.  Every spec and example is a little different, and you'll have to decide what reads better.  Whatever is clearest in any particular case is the way to go.  This is just another tool in your belt.  To be honest, having just written the the thing, I don't know how useful it is yet.  But it seems like it's worth trying out.


Credits
-------

Written by Peter Jaros  
Portions &copy; 2009 Peter Jaros  
Portions &copy; 2009 drop.io, Inc.

Released under the MIT License.  See `LICENSE` for details.
