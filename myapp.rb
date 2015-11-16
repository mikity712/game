require 'rubygems' 
require 'bundler'
Bundler.require
require 'sinatra'
require 'sinatra/reloader'
require 'yaml'
require 'active_record'

ActiveRecord::Base.configurations = YAML.load_file('database.yml')
ActiveRecord::Base.establish_connection(:development)

class Game < ActiveRecord::Base;
end


get '/' do
	erb :access
end

get '/book' do
	@count = Game.count
	erb :index
end

post '/success' do
	answer = params[:answer]
	q = params[:q]
	@games = Game.order(dis_order: :asc)
	number = q.to_i
	@game = @games[number-1]
	if @games[number].nil?
		erb :finish
	elsif answer == @game.ans then
		@num = number+1
		erb :success
	else
		@n = number
		erb :fail
	end
end


get '/game/:number' do
	q = params[:number]
	@games = Game.order(dis_order: :asc)
	@game = @games[q.to_i-1]
	@number = q.to_i
	erb :question
end

get '/question' do
	@count = Game.count
	erb :sendques
end


post '/send-ques' do
	p params
	@ques = params[:ques]
	@ans = params[:ans] 
	@order = params[:order]
	game=Game.new
	game.ques=@ques
	game.ans=@ans
	game.dis_order=@order
	game.save
	redirect '/'
end