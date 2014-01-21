#Level 4 use method, instance var, constants
class Player
  Maxhealth = 20 # according to the level become higher, change the value
  def initialize()
    @health = 20
    @under_attack = false
  end

  def play_turn(warrior)
    if warrior.health < @health # determine whether the warrior is under attack
      @under_attack = true
    else
      @under_attack = false
    end

    @health = warrior.health
    if warrior.feel.empty?
      if warrior.health < Maxhealth and (not @under_attack)
        warrior.rest! # if empty and the value of health is below Maxhealth, rest
      else
        warrior.walk!
      end
    else
      warrior.attack! # if not empty
    end
  end
end

