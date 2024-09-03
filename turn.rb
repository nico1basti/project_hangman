class Turn 
  def initialize (game)
    @game = game
    @game.display_new_turn @game.turn_number
    get_guess
  end

  def get_guess 
    @guess = gets.chomp
    if /^[a-zA-Z]$/.match?(@guess)
      if @game.selected_word_array.include? @guess 
        add_letters 
      else 
        add_error
      end

    else
      @game.display_guess_not_match
    end

  end

  def add_letters 
    @game.hidden_letters.map!.with_index do |value, index| 
      @game.selected_word_array[index] == @guess ?
      @guess : value
    end
    @game.turn_number += 1
  end

  def add_error
    case @game.error_number
    when 0 
      @game.hangman[1] = @game.errors[0]
    when 1
      @game.hangman[2] = @game.errors[1]
    when 2
      @game.hangman[2] = @game.errors[2]
    when 3 
      @game.hangman[2] = @game.errors[3]
    when 4 
      @game.hangman[3] = @game.errors[4]
    when 5
      @game.hangman[3] = @game.errors[5]
    end
    @game.error_number += 1
    @game.turn_number += 1
  end
end