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


get '/index' do
	erb :access
end
get '/' do
	erb :index
end

post '/success' do
	answer = params[:message]
	q = params[:q]
	case q
	when "1" then
		if answer == "45" then
			@num = "2"
			erb :success
		else
			@n = "/"
			erb :fail
		end
	when "2" then
		if answer == "2" then
			@num = "3"
			erb :success
		else 
			@n = "2"
			erb :fail
		end
	end 
end

# post '/success' do
# 	answer = params[:message]
# 	q = params[:q]
# 	if q == "1" then
# 		if answer == "10" then
# 			@num = "2"
# 			erb :success
# 		else
# 			@n = "/"
# 			erb :fail
# 		end
# 	elsif q == "2" then 
# 		if answer == "2" then
# 			@num = "3"
# 			erb :success
# 		else 
# 			@n = "2"
# 			erb :fail
# 		end
# 	end 
# end



get '/2' do
	@game = Game.order(dis_order: :asc)
erb :q2
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
	redirect '/index'
end