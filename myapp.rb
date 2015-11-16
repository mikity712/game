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
	erb :index
end

post '/success' do
	answer = params[:answer]
	q = params[:q]
	@games = Game.order(dis_order: :asc)
	p params[:ans]
	case q
	when "1" then
		@game = @games[0]
		if answer == @game.ans then
			@num = "2"
			erb :success
		else
			@n = "1"
			erb :fail
		end
	# when "2" then
	# 	@game = @games[1]
	# 	if answer == @game.ans then
	# 		@num = "3"
	# 		erb :success
	# 	else 
	# 		@n = "2"
	# 		erb :fail
	# 	end
	end 
end


get '/1' do
	@games = Game.order(dis_order: :asc)
	@game = @games[0]
	@number = "1"
	erb :question
end

get '/2' do
	@games = Game.order(dis_order: :asc)
	@game = @games[1]
	@number = "2"
	erb :question
end

get '/question' do
	@count = Game.count
	erb :sendques
end


post '/send-ques' do
	@ques = params[:ques]
	@ans = params[:ans] 
	@order = params[:order]
	game=Game.new
	game.ques=@ques
	game.ans=@ans
	game.dis_order=@order
	game.save
	redirect '/access'
end