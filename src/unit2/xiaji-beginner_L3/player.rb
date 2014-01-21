#Level 3
class Player
  Maxhealth = 15
  def play_turn(warrior)
    if warrior.feel.empty? #
      if warrior.health <= Maxhealth # if empty and the value of health is not greater than Maxhealth
        warrior.rest! # then have a rest
      else
        warrior.walk! # or just walk
      end
    else
      warrior.attack! # not empty, then attack
    end
  end
end

