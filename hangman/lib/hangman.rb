class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    return true if attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    result_indices = []
    @secret_word.each_char.with_index {| letter, idx | result_indices << idx if letter == char }
    result_indices
  end

  def fill_indices(char, arr)
    arr.each { | indice |  @guess_word[indice] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false 
    end
    @attempted_chars << char
    
    result = self.get_matching_indices(char)
    if result.empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, result)
    end
    return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    user_input = gets.chomp
    self.try_guess(user_input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true
    else
      return false
    end
  end


end

