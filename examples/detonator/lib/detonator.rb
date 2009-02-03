class Explosion < Exception; end

class Detonator
  def initialize
    @keys = {}
    @safety_on = true
  end
  
  def turn_key(key_num)
    @keys[key_num] = true
  end
  
  def turn_off_safety
    @safety_on = false
  end
  
  def push_big_red_button
    raise Explosion if @keys[1] and @keys[2] and not @safety_on
  end
end
