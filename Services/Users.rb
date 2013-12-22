# Users.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"
require_relative "../Model/UsersModel"

# Operations
################################

post '/users/v1/login?' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['username', 'password'])
	
	# Specific Logic
	if params[:password] != 'pass'

		# Returning an error
		halt render_error(:not_authenticated, 'Please check your e-mail address and password')
	end

	# Search for the user
	users.each { |user|
		if user.user_info.email == params[:username]
			@user = user
		end
	}

	# If there isn't a user, that's an error
	if not @user
		halt render_error(:not_authenticated, 'Please check your e-mail address and password')
	
	# Else, everything is ok, we found the user
	else
		json @user
	end
end

post '/users/v1/register?' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['username', 'password', 'first_name', 'last_name'])
	
	# Search for the user
	users.each { |user|
		if user.user_info.email == params[:username]
			@user = user
		end
	}
	
	# If there is a user with that email, that's an error
	if @user
		halt render_error(:user_exists, 'You are already registered')
	
	# Else, everything is ok, its a new user. Add it to array and return it
	else
		@user = UserResponse.new(UserInfo.new("id_#{users.length+1}", params[:first_name], params[:last_name], params[:username], nil), '3edc4rfn')
		#users.push(_user, '3edc4rfn')
		json @user
		
	end
	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	