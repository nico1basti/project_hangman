require_relative 'start'
require_relative 'turn'
require_relative 'display'
require_relative 'game'

class Start 
  attr_reader :selected_word

  def initialize 
    charge_dictionary
    select_word
    create_hangman
    Game.new select_word, @hangman, @errors
  end

  def charge_dictionary 
    @dictionary = File.readlines('google-10000-english-no-swears.txt')
    @dictionary.map! do |word|
      word[0...-1]
    end
  end

  def select_word
    @constrained_dictionary = @dictionary.filter do |word|
      word.length > 5 && word.length < 12
    end
    random_index = rand(0..(@constrained_dictionary.length-1))
    @selected_word = @constrained_dictionary[random_index]
  end

  def create_hangman 
    @hanger =  <<-HEREDOC  
      ---------
          |     
      HEREDOC
    @head = ''
    @body = ''
    @legs = ''
    @first_error = <<-HEREDOC 
          O
      HEREDOC
    @second_error = <<-HEREDOC 
         /
      HEREDOC
    @third_error = <<-HEREDOC 
         /|

      HEREDOC
    @fourth_error = <<-HEREDOC
         /|\\
      HEREDOC
    @fifth_error = <<-HEREDOC
         /
      HEREDOC
    @sixth_error = <<-HEREDOC
         / \\
      HEREDOC
    @hangman = [@hanger, @head, @body, @legs]
    @errors = [@first_error, @second_error, @third_error, @fourth_error, @fifth_error, @sixth_error]
  end
end

Start.new