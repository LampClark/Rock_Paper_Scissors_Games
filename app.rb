require 'sinatra'
enable :sessions

get '/' do
    erb :index
end

post '/start' do
    @name = params[:name]
    erb :start
end

post '/result' do
    @player_choice = params[:choice]
    @computer_choice = ["rock", "paper", "scissors"].sample
    session[:wins] ||= 0
    session[:losses] ||= 0
    session[:draw] ||= 0

    case
    when (@player_choice == 'rock' && @computer_choice == 'scissors') ||
        (@player_choice == 'scissors' && @computer_choice == 'paper') ||
        (@player_choice == 'paper' && @computer_choice == 'rock')
    session[:wins] += 1
    @outcome = "You won! | AI lose!"
    when (@player_choice == 'scissors' && @computer_choice == 'rock') ||
        (@player_choice == 'paper' && @computer_choice == 'scissors') ||
        (@player_choice == 'rock' && @computer_choice == 'paper')
    session[:losses] += 1
    @outcome = "You lose! You lose!"
    else
    @outcome = "Draw!"
    session[:draw] += 1
    end

    puts @outcome

    erb :result
  end
