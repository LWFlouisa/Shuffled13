def cette_int(condition)
  if condition
    yield
    
    return true
  end
  
  false
end

def maisette_int(already_done, condition)
  return true if already_done
  
  if condition
    yield
    
    return true
  end
end

def sinon_int(already_done)
  yield unless already_done
  
  unless already_done
    puts "Adviser: Let me think..."
  end
end

## That time
def self.sore_float(condition)
  if condition
    yield
    
    return true
  end
  
  false
end

def self.shikashi_float(already_done, condition)
  return true if already_done
  
  if condition
    yield
    
    return true
  end
end

def self.sonota_float(already_done)
  yield unless already_done
  
  unless already_done
    puts "Adviser: Let me think..."
  end
end

## A place of many rivers flowing together.
def self.matawa_float(already_done)
  yield unless already_done
  
  unless already_done
    puts "Adviser: Let me think..."
  end
end

def schoolyard_analyses
  require "NeoPathfinding"

  schoolyard_and_tree = [
    [ :framed_john,           "Tree is planted on plot in Schoolyard. John chats with tree Tree about its day. Tree murders student Bethany, telling John they framed them for their murder.", 0.004500508 ],
    [ :framed_bethany,   "Tree is planted on plot in Schoolyard. John chats with tree Tree about its day. Tree murders student John, telling Bethany they framed them for their murder.", 0.000490105 ],
    [ :framed_tree,      "Tree is planted on plot in Schoolyard. John chats with tree Tree about its day. Bethany murders student Tree, telling John they framed them for their murder.", 0.018002030 ],
  ]

  non_euclidean_spaces = [
    [ :johns_reality, "Airport is a local reality zone of Beach House, with Airport having a local y of 499 and x of 374. But Beach House itself only has a y of 499 and an x of 374.", 0.003415838 ],
    [ :bathanys_reality, "Musical Theatre is a local reality zone of Beach House, with Musical Theatre having a local y of 358 and x of 268. But Beach House itself only has a y of 358 and an x of 268.", 0.041326975 ],
    [ :trees_reality, "Bar And Grill is a local reality zone of Basement, with Bar And Grill having a local y of 499 and x of 374. But Basement itself only has a y of 499 and an x of 374.", 0.21780000000000002 ],
  ]

  puts "Framed John"
  puts schoolyard_and_tree[0][1]
  #thresholding(schoolyard_and_tree[0][2], 12, 12)

  puts "Johns Reality"
  puts non_euclidean_spaces[0][1]
  #thresholding(non_euclidean_spaces[0][2], 12, 12)

  puts "Framed Bethany"
  puts schoolyard_and_tree[1][1]
  #thresholding(schoolyard_and_tree[1][2], 12, 12)

  puts "Bethany Reality"
  puts non_euclidean_spaces[1][1]
  #thresholding(non_euclidean_spaces[1][2], 12, 12)

  puts "Framed Tree"
  puts schoolyard_and_tree[2][1]
  #thresholding(schoolyard_and_tree[2][2], 12, 12)

  puts "Tree's Reality"
  puts non_euclidean_spaces[2][1]
  #thresholding(non_euclidean_spaces[2][2], 12, 12)
end

def vacekudo # Activated
  vacekudo   = "Cow Black; a shade of off black that is warmer in color."

  2.times do
    get_statistic(:red_black,       "This is red black.",
                  :orange_black, "This is orange black.",
                  :yellow_black, "This is yellow black.")
                  
                  dynamic_reward_allocation
  end
  
  current_vacekudo = sore_float($current_probability > 0.80) do
    puts "Advisor: You starting to concentrate to much of #{$current_label}."
  end

  current_vacekudo = shikashi_float(current_vacekudo, $enemy_def < 0.20) do
    puts "Advisor: You don't have nearly enough of #{$current_label}."
  end

  current_vacekudo = matawa_float(current_vacekudo) do
    puts "Advisor: This is where you are with the color #{$current_label}."
    thresholding($current_probability, 12, 12)
  end  
end

def nevacekudo # Deactivated
  nevacekudo = "Not Cow Black; a shade of off black that is cooler in color in counterance to cow black."

  2.times do
    get_statistic(:green_black,   "This is green black.",
                  :blue_black,     "This is blue black.",
                  :purple_black, "This is purple black.")
                  
                  dynamic_reward_allocation
  end
  
  current_nevacekudo = sore_float($current_probability > 0.80) do
    puts "Advisor: You starting to concentrate to much of #{$current_label}."
  end

  current_nevacekudo = shikashi_float(current_nevacekudo, $enemy_def < 0.20) do
    puts "Advisor: You don't have nearly enough of #{$current_label}."
  end

  current_nevacekudo = matawa_float(current_nevacekudo) do
    puts "Advisor: This is where you are with the color #{$current_label}."
    thresholding($current_probability, 12, 12)
  end  
end

def get_statistics(a1, a2, b1, b2, c1, c2)
  a = [ a1, a2 ]
  b = [ b1, b2 ]
  c = [ c1, c2 ]

  matrix = [[
    [[a[0], a[0]], [a[0], b[0]], [a[0], c[0]]],
    [[b[0], a[0]], [b[0], b[0]], [b[0], c[0]]],
    [[c[0], a[0]], [c[0], b[0]], [c[0], c[0]]],
  ], [
    [[a[1], a[1]], [a[1], b[1]], [a[1], c[1]]],
    [[b[1], a[1]], [b[1], b[1]], [b[1], c[1]]],
    [[c[1], a[1]], [c[1], b[1]], [c[1], c[1]]],
  ], [
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
    [[0.50, 0.50], [0.50, 0.50], [0.50, 0.50]],
  ]]

  label_type       = matrix[0]
  definition_type  = matrix[1]
  probability_type = matrix[2]
  
  row_probability = 0.33
  col_probability = 0.33
  
  graph_selection = row_probability * col_probability

  row_options = [0, 1, 2]
  col_options = [0, 1, 2]
  arr_options = [0, 1]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample
  
  current_label       = label_type[cur_row][cur_col][cur_arr]
  current_definition  = definition_type[cur_row][cur_col][cur_arr]
  
  base_probability = probability_type[cur_row][cur_col][cur_arr].to_i
  
  current_probability = base_probability + graph_selection
  
  current_probability = current_probability + current_probability
  current_information = "#{current_label} #{current_definition}"
  
  puts "I'm confident it is not [ #{current_label} #{current_definition} ] as it has only #{current_probability} probability."
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
  
  #File.open("data/statistics/probability/current_probability.txt", "w") { |f|
  #  f.puts current_probability
  #}
  
  #File.open("data/statistics/label/current_information.txt", "w") { |f|
  #  f.puts current_information
  #}
end

def reasses
  current_probability = File.read("data/statistics/probability/current_probability.txt").to_f
  current_information = File.read("data/statistics/label/current_information.txt")

  if current_probability > 0.999999999999999999
    current_probability = 0.9 / current_probability
  end
  
  case current_probability
  when 0.003921569000000000..0.287225000000000000
    puts "I'm confident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.287225000000000001..0.522225000000000000
    puts "I'm less unconfident it is not [ #{current_information} ] as its only #{current_probability}."
  when 0.522225000000000001..0.756112500000000000
    puts "I'm almost sure it is [ #{current_information} ] because it has #{current_probability}."
  when 0.756112500000000001..0.999999999999999999
    puts "I'm sure it is [ #{current_information} ] after all it has #{current_probability}."

  else
    puts "The probability is either to low or to large, so I can't determine exactly."
  end
  
  current_probability    = current_probability + current_probability
  
  File.write("data/statistics/probability/current_probability.txt", "#{current_probability}")
  File.write("data/statistics/label/current_information.txt",       current_information)
end

def dynamic_reward_allocation
  l1_reasses = "level one reasses"
  l2_reasses = "level two reasses"
  l3_reasses = "level tre reasses"
  l4_reasses = "level fro reasses"

  reward_model = [
    [[l1_reasses, l1_reasses, l1_reasses, l1_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l2_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l3_reasses],
     [l1_reasses, l1_reasses, l1_reasses, l4_reasses]],
   
    [[l2_reasses, l2_reasses, l2_reasses, l1_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l2_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l3_reasses],
     [l2_reasses, l2_reasses, l2_reasses, l4_reasses]],
   
    [[l3_reasses, l3_reasses, l3_reasses, l1_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l2_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l3_reasses],
     [l3_reasses, l3_reasses, l3_reasses, l4_reasses]],
   
    [[l4_reasses, l4_reasses, l4_reasses, l1_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l2_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l3_reasses],
     [l4_reasses, l4_reasses, l4_reasses, l4_reasses]],
  ]

  row_options = [0, 1, 2, 3]
  col_options = [0, 1, 2, 3]
  arr_options = [0, 1, 2, 3]

  cur_row = row_options.sample
  cur_col = col_options.sample
  cur_arr = arr_options.sample

  current_reward_structure = reward_model[cur_row][cur_col][cur_arr]

  if    current_reward_structure == l1_reasses; reasses
  elsif current_reward_structure == l2_reasses; 2.times do reasses end
  elsif current_reward_structure == l3_reasses; 3.times do reasses end
  elsif current_reward_structure == l4_reasses; 4.times do reasses end
  else
    reasses
  end
end


def self.init_game
  ## This determines player base stats.
  $player_level = 5
    
  $player_sanity = 100

  $player_sanity_upper = $player_sanity * 0.80
  $player_sanity_lower = $player_sanity * 0.20
      
  $player_trust  = 100

  $player_trust_upper = $player_trust * 0.80
  $player_trust_lower = $player_trust * 0.20

  $player_potions = [ 3, 7, 9, 11, 13, 15 ].sample

  $player_hp      = 10 * $player_level
      
  $player_hp_upper = $player_hp * 0.80
  $player_hp_lower = $player_hp * 0.20 
      
  $player_atk     =  4 * $player_level
      
  $player_atk_upper = $player_atk * 0.80
  $player_atk_lower = $player_atk * 0.20 
      
  $player_def     =  2 * $player_level

  $player_def_upper = $player_def * 0.80
  $player_def_lower = $player_def * 0.20 

  $player_heal    =  2 * $player_level

  $player_heal_upper = $player_heal * 0.80
  $player_heal_lower = $player_heal * 0.20 

  ## This determines enemy base stats.
  $enemy_level  = 5

  $enemy_hp   = 10 * $enemy_level

  $enemy_hp_upper = $enemy_hp * 0.80
  $enemy_hp_lower = $enemy_hp * 0.20 

  $enemy_atk  =  4 * $enemy_level

  $enemy_atk_upper = $enemy_atk * 0.80
  $enemy_atk_lower = $enemy_atk * 0.20 

  $enemy_def  =  2 * $enemy_level

  $enemy_def_upper = $enemy_def * 0.80
  $enemy_def_lower = $enemy_def * 0.20 

  $enemy_heal =  2 * $enemy_level

  $enemy_heal_upper = $enemy_heal * 0.80
  $enemy_heal_lower = $enemy_heal * 0.20 
end

def demerite_de_batailles
  system("clear")
  
  puts "Démérite De Bataille / Sento no demeritto"
  puts "You've been taken through the rafters! Your life vessles are now legally forfeit."

  sleep(1.5)

  print "HP: #{$player_hp} => "
  $player_hp     = $player_hp     * 0.67
  puts "#{$player_hp.round}"
  
  print "ATK: #{$player_atk} => "
  $player_atk    = $player_atk     * 0.67
  puts "#{$player_atk.round}"
  
  print "DEF: #{$player_def} => "
  $player_def     = $player_def     * 0.67
  puts "#{$player_def.round}"
  
  print "HEAL: #{$player_heal} => "
  $player_heal     = $player_heal     * 0.67
  puts "#{$player_heal.round}"

  print "TRUST: #{$player_tru} => "
  $player_tru     = $player_tru     * 0.67
  puts "#{$player_tru.round}"

  print "SANITY: #{$player_san} => "
  $player_san     = $player_san     * 0.67
  puts "#{$player_san.round}"
end
    
def healing_formula
  require "NeoPathfinding"
      
  2.times do
    get_statistics(:enemy_hp,  "While the enemy can level up with the player, the adviser will let you know when they're weakened.",
                   :enemy_atk, "The adviser will let you know when the enemy currently has the least amount of strength.",
                   :enemy_def, "Sometimes the enemy will have low enough defence to prevent attack reduction.")
                       
                   dynamic_reward_allocation
  end
    
  $player_hp = $player_hp + ( 100 * $current_probability )
  $player_hp = $player_hp.to_i
      
  $potions = $potions - 1
end

def monitor_ehp
  current_ehp = a.cette_int($enemy_hp > 8) do
    puts "Advisor: Be mindful as the enemy still has lots of vitalty."
  end

  current_ehp = a.maisette_int(current_ehp, $enemy_hp < 2) do
    puts "Advisor: Quickly, put them out of their misery so you can move onto the next enemy."
  end

  current_ehp = a.sinon_int(current_ehp) do
    puts "Advisor: This enemy may still have some life left in them."
  end     
end
    
def monitor_eatk
  current_eatk = a.cette_int($enemy_atk > 8) do
    puts "Advisor: Be mindful as the enemy still has lots of strength."
  end

  current_eatk = a.maisette_int(current_atk, $enemy_hp < 2) do
    puts "Advisor: Take advantage of when your enemy's strength is at its lowest."
  end

  current_eatk = a.sinon_int(current_eatk) do
    puts "Advisor: The enemy may still be able to pack a wallop."
  end    
end
    
def monitor_edef
  current_edef = a.cette_int($enemy_def > 8) do
    puts "Advisor: Be mindful as the enemy block most of your attacks."
  end

  current_edef = a.maisette_int(current_edef, $enemy_def < 2) do
    puts "Advisor: Take advantage of when your enemy's shields are lowered."
  end

  current_edef = a.sinon_int(current_edef) do
    puts "Advisor: The enemy has less shields, but still be cautious."
  end  
end
    
def monitor_eheal
  current_eheal = a.cette_int($enemy_heal > 8) do
    puts "Advisor: Be mindful as the enemy completely heal themselves."
  end

  current_eheal = a.maisette_int(current_heal, $enemy_heal < 2) do
    puts "Advisor: Take advantage of when your enemy has trouble finding first aid."
  end

  current_eheal = a.sinon_int(current_heal) do
    puts "Advisor: The enemy has less first aid logistics, but still be cautious."
  end 
end
    
def monitor_hp
  current_hp = a.cette_int($player_hp_upper > 8) do
    puts "Advisor: You should be good to go."
  end

  current_hp = a.maisette_int(current_hp, $player_hp_lower < 2) do
    puts "Advisor: You shoulder consider using a health potion."
        
    healing_formula
  end

  current_hp = a.sinon_int(current_hp) do
    puts "Advisor: Be mindful to make sure your health doens't go to zero."
  end     
end
    
def monitor_atk
  current_atk = a.cette_int($player_atk_upper > 8) do
    puts "Advisor: You should be good to go."
  end

  current_atk = a.maisette_int(current_atk, $player_atk_lower < 2) do
    puts "Advisor: You shoulder consider having your pet take care of attacking."
  end

  current_atk = a.sinon_int(current_hp) do
    puts "Advisor: Be mindful to make sure your attack power doens't go to zero."
  end    
end
    
def monitor_def
  current_def = a.cette_int($player_def_upper > 8) do
    puts "Advisor: You should be good to go."
  end

  current_def = a.maisette_int(current_def, $player_def_lower < 2) do
    puts "Advisor: You shoulder consider replenishing your shields."
  end

  current_def = a.sinon_int(current_def) do
    puts "Advisor: Be mindful to make sure your defence doens't go to zero."
  end  
end
    
def monitor_heal
  current_heal = a.cette_int($player_heal_upper > 8) do
    puts "Advisor: You should be good to go."
  end

  current_heal = a.maisette_int(current_heal, $player_heal_lower < 2) do
    puts "Advisor: You shoulder consider get some rest to make sure your body can heal."
  end

  current_heal = a.sinon_int(current_heal) do
    puts "Advisor: Be mindful to make sure your healing doens't go to zero."
  end 
end
    
def monitor_sanity
  if $player_sanity < 1
    system("clear")
        
    puts "You spend the rest of your days inside of a padded room."
        
    abort
  end
      
  current_sanity = a.cette_int($player_sanity_upper > 80) do
    puts "Advisor: You should be good to go."
  end

  current_sanity = a.maisette_int(current_sanity, $player_sanity_lower < 2) do
    puts "Advisor: You should consider volunteering yourself for an evaluation."
  end

  current_heal = a.sinon_int(current_heal) do
    puts "Advisor: Be mindful not to lose your mind going down these hallways."
  end 
end
    
def monitor_trust
  current_trust = a.cette_int($player_trust_upper > 80) do
    puts "Advisor: You should be good to go."
  end

  current_trust = a.maisette_int(current_sanity, $player_trust_lower < 20) do
    puts "Advisor: The gods of the sea may curse you if you double cross them."
  end

  current_heal = a.sinon_int(current_heal) do
    puts "Advisor: Be mindful not to lose your mind going down these hallways."
  end 

  if $player_trust < 1
    system("clear")
        
    demerite_de_batailles
        
    $player_trust = 100
  end
end

def elure
  puts "The enemy lures the player in their general direction..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "lure"
  }
      
  enemy_actions
end
    
def estun
  puts "The enemy attempts to stun the player..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "stun"
  }
      
  enemy_actions
end
    
def etrap
  puts "The enemy attempts to trap the player..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "trap"
  }
      
  enemy_actions
end

def self.enemy_actions
  require "NeoPathfinding"
  
  previous_player_actions = File.readlines("data/player/previous_actions.txt")
  index = 0
  
  3.times do
    ideal_action = previous_player_actions.sample
  
    2.times do
      get_statistics(:lure, "lure",
                     :stun, "stun",
                     :trap, "trap")
  
                     dynamic_reward_allocation
    end
    
    predicted_action = $current_definition
    
    if predicted_action == ideal_action
      puts "The enemy action performs: #{prediction_action}"
      
      enemy_actions = ["lure", "stun", "trap"]
      
      current_e_action = enemy_actions.sample
      
      if    current_e_action == "lure"; elure
      elsif current_e_action == "stun"; estun
      elsif current_e_action == "trap"; etrap
      else
        elure
      end
    else
      puts "The enemy fails to match your pevious action."
    end
    
    index = index + 1
  end
end

def self.lure
  puts "The player lures the enemy in their general direction..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "lure"
  }
      
  enemy_actions
end
    
def self.stun
  puts "The player attempts to stun the enemy..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "stun"
  }
      
  enemy_actions
end
    
def self.trap
  puts "The player attempts to trap the enemy..."
    
  File.open("data/player/previous_actions.txt", "a") { |f|
    f.puts "trap"
  }
      
  enemy_actions
end

def gameloop
  if $player_hp < 1
    system("clear")
      
    puts "YOU LOSE"
  else
    monitor_hp
    monitor_atk
    monitor_def
    monitor_heal
    monitor_sanity
    monitor_trust
  end
    
  if $enemy_hp < 1
    system("clear")
      
    puts "YOU WIN"
  else
    monitor_ehp
    monitor_eatk
    monitor_edef
    monitor_eheal
  end
      
  conditions = {
    "lure" => "stun",
    "stun" => "trap",
    "trap" => "lure",
  }

  puts "\n[ PLAYER ] HP: #{$player_hp} ATK: #{$player_atk} DEF: #{$player_def} SAN: #{$player_sanity} TRU: #{$player_trust} POTIONS: #{$potions}"
  puts "[ Enemy ] HP: #{$enemy_hp} ATK: #{$enemy_atk} DEF: #{$enemy_def}"

  @cchoice = [ "lure", "stun", "trap" ]
    
  print "Player << "; @choice = gets.chomp
  puts "Enemy: #{@cchoice}"

  if actions[@cchoice] == @choice
    $player_hp = $player_hp + 1
    
    puts "Player Action: #{@choice}"
  
    # Check the player's choice string, not the actions hash
    if    @choice == "lure"; lure
    elsif @choice == "stun"; stun
    elsif @choice == "trap"; trap
    else
      lure
    end
  elsif @choice == @cchoice
    puts "Stalemate"
            
    ## Performs a counterstrike
    counterstrike = counterstrike

    current_counter = $current_counterstrike

    if $countestrike == actions[@cchoice]
      puts "Adviser: You managed to counterstrike."
          
      $enemy_hp = $enemy_hp - 2
    else
      puts "Adviser: You did not manage to counterstrike."
    end

    $player_hp = $player_hp - 1
    $enemy_hp  = $enemy_hp - 1
  elsif actions[@choice] == @cchoice
    puts "The enemy launches a more powerful attacl."
      
    $player_hp = $player_hp - 1
    
    #puts @choice
    #puts @cchoice
  else
    puts "This action was not understood..."
  end
end
