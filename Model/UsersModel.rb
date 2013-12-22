# UsersModel.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"

# Classes
################################

class UserInfo < Jsonable

	# Define getters to all of the params
	attr_reader :id, :first_name, :last_name, :email, :avater

	# Ctor
	def initialize(id, first_name, last_name, email, avatar)
		@id = id
		@first_name = first_name
		@last_name = last_name
		@email = email
		@avatar = avatar
	end
end

class UserResponse < Jsonable
	
	# Define getters to all of the params
	attr_reader :user_info, :user_token

	# Ctor
	def initialize(user, token)
		@user_info = user
		@user_token = token
	end
end

# Global Helper
################################

helpers do
  	def users
  		if not @users
		    @users = Array[
				UserResponse.new(UserInfo.new('id_1', 'First', 'Last', 'a@a.com', 'http://ladyenews.files.wordpress.com/2011/03/smiley-emoticon.png'), '1qaz2wsx'),
				UserResponse.new(UserInfo.new('id_2', 'Second', 'Last', 'b@b.com', 'http://centreforwaterresourcesstudies.dal.ca/img/people/tb_placeholder-person-girl.png'), '2wsx3edc'),
				UserResponse.new(UserInfo.new('id_3', 'Third', 'Last', 'c@c.com', 'http://hbhsswim.com/wordpress/wp-content/uploads/2013/01/placeholder.gif'), '3edc4rfv')
			]
		end
		return @users
  	end
end

