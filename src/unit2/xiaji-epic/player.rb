#epic level
#constants: the boundary valuve of health, 15 is upper, 10 is lower
#class var: start_rest, a flag of starting resting; turn, whether user should turn
#instance var: severals
#array: options in function shooting_target
#functions: rescue_captive, rest_and_health, attack_enemy, ....
#hash: options in function captive_nearby
class Player

  Maxhealth = 15
  Minhealth = 10
  @start_rest = false
  @turn = false

  def play_turn(warrior)

    @turn = false

    # Rescue first
    rescue_captive(warrior)

    # Rest and health be greater than Maxhealth
    rest_and_health(warrior)

    # Whether attack
    attack_enemy(warrior)

    # Whether shoot
    shoot_enemy(warrior)

    # Whether need to rest
    rest(warrior)

    # Whether walk
    walk(warrior)

    # Whether need to turn around
    turn_around(warrior)

    @health = warrior.health

  end

  def turn_around(warrior)
    if warrior.feel.wall? or shooting_target(warrior.look(:backward)) and not @turn
      warrior.pivot!
      @turn = true
    end
  end

  def attack_enemy(warrior)
    if  !(warrior.feel.empty?) and !(warrior.feel.captive?) and !(warrior.feel.wall?) and !@turn # It's an enemy
      warrior.attack!
      @turn = true
    end
  end

  def shoot_enemy(warrior)
    if !@turn and shooting_target(warrior.look)
      warrior.shoot!
      @turn = true
    end
  end

  def walk(warrior)
    if warrior.feel.empty? and !shooting_target(warrior.look) and !(@start_rest) and !@turn
      warrior.walk!
      @turn = true
    end
  end

  # look for whether there is a captive nearby
  def captive_nearby(look)
    @captive_front = false
    options = Hash.new("Warrior")
    options["s"] = "Thick Sludge"
    options["w"] = "Wizard"
    options["a"] = "Archer"
    options["c"] = "Captive"
    look.each do |space|
      if space.to_s == options["s"] or space.to_s == options["w"] or space.to_s == options["a"]
        @captive_front = false
        break
      elsif space.to_s == options["c"]
        @captive_front = true
        break
      end
    end
    return @captive_front
  end

  # whether there is any target
  def shooting_target(look)
    @target = false
    @captive_front = false
    options = ['Thick Sludge', 'Wizard', 'Archer', 'Captive']
    look.each do |space|
      if space.to_s == options[0]
        @target = false
        break
      elsif space.to_s ==  options[1] or space.to_s ==  options[2]
        # target to shoot
        @target = true
        break
      elsif space.to_s ==  options[3]
        @captive_front = true
        break
      end
    end
    return @target && !@captive_front
  end

  def rescue_captive(warrior)
    if warrior.feel.captive? and not @turn
      warrior.rescue!
      @turn = true
    elsif captive_nearby(warrior.look) and not @turn
      warrior.walk!
      @turn = true
    elsif captive_nearby(warrior.look(:backward)) and not @turn
      warrior.pivot!
      @turn = true
    elsif warrior.feel(:backward).captive? and not @turn
      warrior.rescue!(:backward)
      @turn = true
    end
  end

  def rest(warrior)
    rest_start(warrior) if (warrior.health < Minhealth) and not (warrior.health < @health) and not (@start_rest)
  end

  def rest_start(warrior)
    if not @turn
      warrior.rest!
      @start_rest = true
      @turn = true
    end
  end

  # rest until health >= Maxhealth
  def rest_and_health(warrior)
    if (@start_rest) and not (warrior.health >= Maxhealth) and not @turn
      warrior.rest!
      @turn = true
    elsif  warrior.health >= Maxhealth
      @start_rest = false
    end
  end

end
