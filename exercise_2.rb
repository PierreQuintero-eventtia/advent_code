
# "The first column is what your opponent is going to play: A for Rock, B for Paper, and C for Scissors. The second column--" Suddenly, the Elf is called away to help with someone's tent.

# The second column, you reason, must be what you should play in response: X for Rock, Y for Paper, and Z for Scissors. 
# Winning every time would be suspicious, so the responses must have been carefully chosen.

# The winner of the whole tournament is the player with the highest score. Your total score is the sum of your scores for each round. 
# The score for a single round is the score for the shape you selected (1 for Rock, 2 for Paper, 
#   and 3 for Scissors) plus the score for the outcome of the round (0 if you lost, 3 if the round was a draw, and 6 if you won).


file= File.read("input_exercise_2.rb")
arr= file.split("\n")
strategy= arr.map{|item| item.split(" ")}


STANDARIZED_OPTION={"A"=> "Rock", "X"=> "Rock", "B"=> "Paper", "Y"=> "Paper", "C"=> "Scissors", "Z" => "Scissors" }
SCORE_OPTIONS= {"Rock"=> 1, "Paper"=> 2, "Scissors"=> 3}
RESULT_COMBINATIONS= {"Rock,Paper" => 6, "Rock,Scissors"=> 0, "Paper,Rock"=> 0, "Paper,Scissors"=> 6, "Scissors,Rock"=> 6, "Scissors,Paper"=> 0 }

class Opponent
  def initialize(option)
    @choice= STANDARIZED_OPTION.dig(option)
  end
  def choice
    @choice
  end
end

class Myself
  def initialize(option)
    @choice= STANDARIZED_OPTION.dig(option)
  end
  def choice
    @choice
  end
end

class Game
  def initialize(opponent, myself)
    @opponent=opponent
    @myself= myself
  end

  def get_score
    option_score= calculate_option_score
    outcome_option = calculate_outcome_score
    option_score + outcome_option
  end

  def calculate_option_score
    SCORE_OPTIONS[@myself.choice]
  end

  def calculate_outcome_score
    return 3 if @opponent.choice == @myself.choice
    RESULT_COMBINATIONS.dig([@opponent.choice, @myself.choice].join(','))
  end

end

arr_result=[]
strategy.each do |item|
  opponent = Opponent.new(item[0].strip)
  myself= Myself.new(item[1].strip)
  game= Game.new(opponent, myself)
  arr_result.push(game.get_score)
end

print arr_result.sum

