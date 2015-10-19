require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index
end

post '/success' do
	answer = params[:message]
	q = params[:q]
	if "10" == answer && "1" == q then
		@num = "2"
		erb :success
	elsif  "1" == q && !("10" == answer) then
		@n = "/"
		erb :fail
	elsif "2"  == answer && "2" == q then 
		@num = "3"
		erb :success
	elsif "2" == q && !("2"  == answer) then
		@n = "2"
		erb :fail
	else
		erb :fail
	end 
end

get '/2' do
	erb :q2
end