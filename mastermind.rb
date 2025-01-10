require_relative 'lib/secret-sequence'
require 'colorize'

def mastermind
  secret = Secret.new
  puts "                      Welcome to MASTERMIND                         ".black.on_green
  puts "--- We'll play a game were you have to guess my secret sequence! ---".black.on_green
  puts "---        I'll pick 4 colors and make a SECRET SEQUENCE!        ---".black.on_green
  puts "---                   Let's start the GAME!                      ---".black.on_green
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
    puts "You choose #{max_tentatives.to_s.green} tentatives! Goodluck!"
    max_tentatives = max_tentatives
    puts "\n"
  end
  tentatives = 0
  player_guess = ""
  color_right_place = 0
  feedback_guess = 0
  while tentatives < max_tentatives
    puts "----- Type a sequence of colors, separated by a space: -----"
    puts "--- The available colors are: #{secret.get_colors.join(', ').on_light_black}! ---"
    puts "You have #{(max_tentatives - tentatives).to_s.red} remaining tentatives, be careful!"
    puts "\n"
    guess = gets.chomp.downcase
    player_guess = ""
    feedback_guess = 0
    color_right_place = 0
    player_guess << guess
    tentatives += 1
    # p secret.get_sequence
     array_guess = player_guess.split(" ")
    if array_guess == secret.get_sequence
      puts "*******  CONGRATULATIONS!!! YOU GOT IT!!!  *******".on_green
      puts "My secret sequence was: #{secret.get_sequence.join(', ').light_green}"
      break
    elsif tentatives == max_tentatives
      puts "Too bad! You didn't get it :( Good luck next time!".on_red
      puts "My secret sequence was: #{secret.get_sequence.join(', ').light_green}!"
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
    puts "-> You got #{feedback_guess.to_s.yellow.underline + " colors".yellow} right and #{color_right_place.to_s.green.underline + " colors".green} in the right spot!"
    # puts "-> Remember, the available colors are: #{secret.get_colors.join(', ').upcase.green.on_red}!"
    puts "_____________________________________________________________"
    puts "\n" 
  end

end

mastermind