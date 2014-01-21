# Level 8, use arrays
class Player
  def play_turn(warrior)
    @space = warrior.look # store the look in the array
    if @space[0].captive?
      warrior.rescue! # if there is a captive, rescue
    elsif (@space[1].captive?)||(@space[2].captive?)
      warrior.walk! # if there is no captives, and next steps have captives, walk
    elsif @space[0].enemy?||@space[1].enemy?||@space[2].enemy? # if have enemy
      warrior.shoot!
    else
      warrior.walk!
    end
  end
end

