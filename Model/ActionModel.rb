# StorageModel.rb


require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"


# Classes
################################

class Action < Jsonable

	# Define getters to all of the params
	attr_reader :id, :user, :date, :type

	# Ctor
	def initialize(id, user, date, type)
		@id = id
		@user = user
		@date = date
		@type = type
	end
end

class  Comment < Action

	# Define getters to all of the params
	attr_reader :text

	# Ctor
	def initialize(id, user, date, type, text)
		super(id, user, date, type)
		@text = text
	end
end

helpers do

	#first user actions
  	def a_user_like
  		if not @a_user_like
		    @a_user_like = Action.new('comment_id_1', users[0].user_info, '2010-12-02T16:17:52.023Z', 5)
		end
		return @a_user_like
  	end

  	 def a_user_comment
  		if not @a_user_comment
		    @a_user_comment = Comment.new('comment_id_2', users[0].user_info, '2010-12-02T16:17:52.023Z', 4, "hello1")
		end
		return @a_user_comment
  	end

  	#second user actions
  	def b_user_like
  		if not @b_user_like
		    @b_user_like = Action.new('comment_id_3', users[1].user_info, '2010-12-02T16:17:52.023Z', 5)
		end
		return @b_user_like
  	end

  	 def b_user_comment
  		if not @b_user_comment
		    @b_user_comment = Comment.new('comment_id_4', users[1].user_info, '2010-12-02T16:17:52.023Z', 4, "hello2")
		end
		return @b_user_comment
  	end

  	 #third user actions
  	def c_user_like
  		if not @c_user_like
		    @c_user_like = Action.new('comment_id_5', users[2].user_info, '2010-12-02T16:17:52.023Z', 5)
		end
		return @c_user_like
  	end

  	 def c_user_comment
  		if not @c_user_comment
		    @c_user_comment = Comment.new('comment_id_6', users[2].user_info, '2010-12-02T16:17:52.023Z', 4, "hello3")
		end
		return @c_user_comment
  	end
end


