#Level 2
class Player
  def play_turn(warrior)
    if warrior.feel.enemy? # feel enemy
      warrior.attack! # then attack
    else
      warrior.walk! # or walk
    end
  end
end
