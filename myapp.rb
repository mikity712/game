require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb :index
end

post '/success' do
	answer = params[:message]
	q = params[:q]
	case q
		when "1" then
			if answer == "10" then
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
	erb :q2
end