require 'sinatra'

get '/' do 

erb :index
end

post '/start' do
    @name = params[:name]
    erb :start
end

post '/result' do
    @player_choice = params[:choice]
    @ai_choice = [Rock, Paper, Scissors].sample

    if @player_choice == @ai_choice
        @outcome = "DRAW !"
    else (player_choice == "Rock" && ai_choice == "Scissors") ||
         (player_choice == "Paper" && ai_choice == "Rock") ||
         (player_choice == "Scissors" && ai_choice == "Paper")
        "YOU WIN ! | AI lose !"
    else
        "AI WIN ! | YOU LOSE !"
    end
end