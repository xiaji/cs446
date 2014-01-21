#Level 7, constant, instance var, function.
class Player
  Maxhealth = 20
  def play_turn(warrior)
    @health ||= warrior.health
    if warrior.feel.wall?
      if warrior.health < Maxhealth # feel the wall and healthy bad
        warrior.rest! # then rest
      else
        warrior.pivot! # or rotate
      end
    else
      if warrior.feel.enemy? # no wall
        warrior.attack! # there is an enemy
      elsif @health > warrior.health # healthy bad
        if warrior.feel.enemy?
          warrior.attack! # enemy attack
        else
          warrior.walk! # or walk
        end
      else
        if warrior.health < Maxhealth # no enemy
          if @pivot == 1
            warrior.walk! # not in the end
          else
            warrior.pivot!
            @pivot = 1 # in the end of road
          end
        else
          warrior.walk!
        end
      end
    end
    @health = warrior.health
  end
end

