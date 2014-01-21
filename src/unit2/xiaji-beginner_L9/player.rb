#Level 9, array space, variables, functions(method)
class Player
  def initialize #init
    @first_turn, @archer_dead, @melee = true, false, false
  end

  def archer_dead?; @archer_dead; # archer dead
  end

  def play_turn(warrior)
    # kill archer with hardcode
    if @first_turn
      @first_turn = false
      return warrior.pivot!
    end
    if !archer_dead?
      if warrior.feel.enemy?
        @melee = true
        return warrior.attack!
      else # feel.empty?
        if @melee
          @archer_dead = true
          return warrior.pivot!
        else
          return warrior.walk!
        end
      end
    end
    warrior.look.each do |space|
      break if space.captive?
      return warrior.shoot! if space.enemy?
    end
    if warrior.feel.captive?
      warrior.rescue!
    elsif warrior.feel.wall?
      warrior.pivot!
    else
      warrior.walk!
    end
  end
end

