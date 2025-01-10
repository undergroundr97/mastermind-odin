require_relative 'lib/secret-sequence'

def mastermind
  secret = Secret.new
  puts "---Welcome to MASTERMIND---"
  puts "---We'll play a game were you have to guess my secret sequence!---"
  puts "---I'll pick FOUR of the available colors and make a SECRET SEQUENCE!---"
  puts "---Let's start the GAME!---"
  puts "-> How many tentatives you would like to have? (max is 10)"
  max_tentatives = gets.chomp.to_i
  if max_tentatives == 0
    max_tentatives = 10
    puts "Alright, your input is invalid, we'll start with 10 tentatives."
    puts "\n"
  elsif max_tentatives > 10
    puts "Max number of tentative for this game is 10! so I'll set it for you!"
    max_tentatives = 10
    puts "\n"
  else
    puts "You choose #{max_tentatives} tentatives! Goodluck!"
    max_tentatives = max_tentatives
    puts "\n"
  end
  tentatives = 0
  player_guess = ""
  color_right_place = 0
  feedback_guess = 0
  while tentatives < max_tentatives
    puts "----- Type a sequence of colors, separated by a space: -----"
    puts "--- The available colors are: #{secret.get_colors.join(', ')}! ---"
    puts "You have #{max_tentatives - tentatives} remaining tentatives, be careful!"
    puts "\n"
    guess = gets.chomp
    player_guess = ""
    feedback_guess = 0
    color_right_place = 0
    player_guess << guess
    tentatives += 1
     array_guess = player_guess.split(" ")
    if array_guess == secret.get_sequence
      puts "YOU GOT IT RIGHT!"
      break
    elsif tentatives == max_tentatives
      puts "Too bad! you didn't get it in this amount of tentatives, good luck next time!"
      break
    elsif array_guess.each_with_index do |color, index|
      if secret.get_sequence.include?(color)
        feedback_guess += 1 
      end
      if array_guess.index(color) == secret.get_sequence.index(color)
        color_right_place += 1
      end
      end
    end
    puts "_____________________________________________________________"
    puts "\n"
    puts "-> You got #{feedback_guess} colors right and #{color_right_place} colors in the right spot!"
    puts "-> Remember, the available colors are: #{secret.get_colors.join(', ')}!"
    puts "_____________________________________________________________"
    puts "\n"
  end

end

mastermind