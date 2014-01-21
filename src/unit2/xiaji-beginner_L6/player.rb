#level 6, use constants, instance var, class var and function
class Player
  Maxhealth = 20
  Minhealth = 10
  def play_turn(warrior)
    @backward = true if @backward.nil? # decide whether go backward
    if @backward
      if warrior.feel(:backward).captive? # the backward has a captive
        @backward = false
        return warrior.rescue! :backward # rescue and backward
      else
        return warrior.walk! :backward # or walk backward
      end
    end
    @health ||= warrior.health
    if warrior.feel.empty?
      if warrior.health < Maxhealth && @health <= warrior.health # decide to rest when do not face enemy
        warrior.rest!
      else
        direction = warrior.health < Minhealth ? :backward : :forward
        warrior.walk! direction
      end
    else
      warrior.feel.enemy? ? warrior.attack! : warrior.rescue!
    end
    @health = warrior.health
  end
end

