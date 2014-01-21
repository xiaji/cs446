#Level 5, instance var, class var, constants, functions, ? : to make codes clean
class Player
  Maxhealth = 15 # from the test maybe 15 can get higher scores
  def play_turn(warrior)
    @health ||= warrior.health
    if warrior.feel.empty?
      warrior.health < Maxhealth && @health <= warrior.health ? warrior.rest! : warrior.walk!
      # ? : to reduce the lines of if else sentences
    else
      warrior.feel.enemy? ? warrior.attack! : warrior.rescue!
    end
    @health = warrior.health
  end
end
