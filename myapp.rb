require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index
end

post '/success' do
	@num = "2"
	@n = "/"
	number = "10"
	Q = "1"
	answer = params[:message]
	q = params[:q]
	if number == answer && Q == q then
	 erb :success
	 else
	 erb :fail
	 end 
end

get '/2' do
	erb :q2
end
post '/success2' do
	@num = "3"
	@n = "2"
	number = "2"
	Q = "2"
	answer = params[:message]
	q = params[:q]
	if number == answer && Q == q then
	 erb :success
	 else
	 erb :fail
	 end 
	end