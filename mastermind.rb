require_relative 'lib/secret-sequence'

def mastermind
  secret = Secret.new
  puts "Welcome to MASTERMIND"
  puts "We'll play a game were you have to guess my secret sequence!"
  puts "The available colors are: #{secret.get_colors.join(', ')}!"
  puts "I'll pick FOUR of the available colors and make a SECRET SEQUENCE!"
  puts "Let's start the GAME!"
  max_tentatives = 3
  tentatives = 0
  player_guess = ""
  color_right_place = 0
  feedback_guess = 0
  p secret.get_sequence
  while tentatives < max_tentatives
    puts "Type a sequence of colors, separated by a space: "
    guess = gets.chomp
    player_guess = ""
    feedback_guess = 0
    player_guess << guess
    tentatives += 1
    p array_guess = player_guess.split(" ")
    if array_guess == secret.get_sequence
      puts "YOU GOT IT RIGHT!"
      break
    elsif array_guess.each_with_index do |color, index|
      if secret.get_sequence.include?(color)
        feedback_guess += 1 
      elsif array_guess.index(color) == secret.get_sequence.index(color)
        color_right_place += 1
      end
      end
    end
    puts "You got #{feedback_guess} color right! and #{color_right_place} colors in the right spot!"
  end

end

mastermind