class Secret
  def initialize
    @colors = ['blue', 'red', 'yellow', 'green','black','purple','yellow']
    @colors_not_changed = ['blue', 'red', 'yellow', 'green','black','purple','yellow']
    
    @secret_sequence = []
    while @secret_sequence.size < 4
       @colors
      random_color = @colors.sample #saving the random color to a variable so it doesn't repeat in the sequence
      @secret_sequence << random_color
      @colors.delete(random_color) #deleting the random color
    end
  end
  def get_colors
    @colors_not_changed
  end
  def get_sequence 
    @secret_sequence
  end
end

