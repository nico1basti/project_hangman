require_relative 'display'

class Game
  include Display
  attr_accessor :hidden_letters, :selected_word_array, :turn_number, :hangman, :errors, :error_number

  def initialize (selected_word, hangman, errors)
    @selected_word = selected_word
    @selected_word_array = selected_word.split('')
    @hangman = hangman
    @errors = errors
    @error_number = 0
    @hidden_letters = Array.new(selected_word.length, '_')
    @turn_number = 1
    display_game_starts
    start_game
  end

  def start_game
    while @hidden_letters.include? '_' and @error_number < 6
      Turn.new self
    end
    game_ends
  end

  def game_ends
    if !hidden_letters.include? '_'
      display_win_game
    elsif @error_number >= 6
      display_lost_game
    end
  end

end