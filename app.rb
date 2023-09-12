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
        @outcome = "Tie!"
    else
        case @player_choice