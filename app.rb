require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
    erb :elephants
  end

def play_rock_paper_scissors(player_choice)
  choices = ["Rock", "Paper", "Scissors"]
  computer_choice = choices.sample

  result = ""

  case player_choice
  when "Rock"
    case computer_choice
    when "Rock"
      result = "We tie"
    when "Paper"
      result = "We lose"
    when "Scissors"
      result = "We win"
    end
  else
    result = "Invalid choice. Please choose Rock, Paper, or Scissors."
  end

  "Player chooses: #{player_choice}<br>Computer chooses: #{computer_choice}<br>Result: #{result}"
end

get '/rock' do
  player_choice = "Rock"
  game_result = play_rock_paper_scissors(player_choice)

  erb :layout do
    "#{game_result}"
end
end
