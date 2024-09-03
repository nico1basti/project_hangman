module Display 
  def display_game_starts
    puts 'Game Starts'
  end
  def display_hangman 
    @hangman.each {|part| puts part}
  end

  def display_turn_number (turn_number)
    puts 'Turn# '+ turn_number.to_s
  end

  def display_hidden_letters
    puts @hidden_letters.join(' ')
  end
  
  def display_guess_message 
    puts 'Guess a letter of the word'
  end

  def display_new_turn turn_number
    display_turn_number turn_number
    display_hangman
    display_hidden_letters
    display_guess_message
  end

  def display_win_game
    puts 'The Game Ended'
    puts 'You win the Game'
    puts 'You guessed the word: ' + @selected_word
  end

  def display_lost_game 
    puts 'The Game Ended'
    puts 'You lost the Game'
    puts @hangman
    puts 'The word was: '+ @selected_word
  end

  def display_guess_not_match
    puts 'Guess can only be a single letter of the alphabet'
  end
end
