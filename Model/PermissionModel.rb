# StorageModel.rb


require "sinatra"
require "sinatra/json"
require_relative "../Model/UsersModel"
require_relative "../Common/Common"


# Classes
################################

class Permission < Jsonable

	# Define getters to all of the params
	attr_reader :id, :entity_type, :entity_id, :entity_name, :type

	# Ctor
	def initialize(id, entity_type, entity_id, entity_name, type)
		@id = id
		@entity_type = entity_type
		@entity_id = entity_id
		@entity_name = entity_name
		@type = type
	end
end

helpers do

	#first user permissions
	 def a_user_view_permission
  		if not @a_user_view_permission
		    @a_user_view_permission = Permission.new('permission_id_1',0,users[0].user_info.id,users[0].user_info.first_name,1)
		end
		return @a_user_view_permission
  	end

  	def a_user_comment_permission
  		if not @a_user_comment_permission
		    @a_user_comment_permission = Permission.new('permission_id_2',0,users[0].user_info.id,users[0].user_info.first_name,2)
		end
		return @a_user_comment_permission
  	end

  	def a_user_edit_permission
  		if not @a_user_edit_permission
		    @a_user_edit_permission = Permission.new('permission_id_3',0,users[0].user_info.id,users[0].user_info.first_name,3)
		end
		return @a_user_edit_permission
  	end


  	def a_user_owner_permission
  		if not @a_user_owner_permission
		    @a_user_owner_permission = Permission.new('permission_id_4',0,users[0].user_info.id,users[0].user_info.first_name,4)
		end
		return @a_user_owner_permission
  	end

  	#second user permissions
  	def b_user_view_permission
  		if not @b_user_view_permission
		    @b_user_view_permission = Permission.new('permission_id_5',0,users[1].user_info.id,users[1].user_info.first_name,1)
		end
		return @b_user_view_permission
  	end

 	def b_user_comment_permission
  		if not @b_user_comment_permission
		    @b_user_comment_permission = Permission.new('permission_id_6',0,users[1].user_info.id,users[1].user_info.first_name,2)
		end
		return @b_user_comment_permission
  	end

 	def b_user_edit_permission
  		if not @b_user_edit_permission
		    @b_user_edit_permission = Permission.new('permission_id_7',0,users[1].user_info.id,users[1].user_info.first_name,3)
		end
		return @b_user_edit_permission
  	end


 	def b_user_owner_permission
  		if not @b_user_owner_permission
		    @b_user_owner_permission = Permission.new('permission_id_8',0,users[1].user_info.id,users[1].user_info.first_name,4)
		end
		return @b_user_owner_permission
  	end

  	#third user permissions
  	def c_user_view_permission
  		if not @c_user_view_permission
		    @c_user_view_permission = Permission.new('permission_id_9',0,users[2].user_info.id,users[2].user_info.first_name,1)
		end
		return @c_user_view_permission
  	end

  	def c_user_comment_permission
  		if not @c_user_comment_permission
		    @c_user_comment_permission = Permission.new('permission_id_10',0,users[2].user_info.id,users[2].user_info.first_name,2)
		end
		return @c_user_comment_permission
  	end

  	def c_user_edit_permission
  		if not @c_user_edit_permission
		    @c_user_edit_permission = Permission.new('permission_id_11',0,users[2].user_info.id,users[2].user_info.first_name,3)
		end
		return @c_user_edit_permission
  	end


  	def c_user_owner_permission
  		if not @c_user_owner_permission
		    @c_user_owner_permission = Permission.new('permission_id_12',0,users[2].user_info.id,users[2].user_info.first_name,4)
		end
		return @c_user_owner_permission
  	end

  	#public permissions
  	def public_view_permission
  		if not @public_view_permission
		    @public_view_permission = Permission.new('permission_id_13',2,nil,'public',1)
		end
		return @public_view_permission
  	end

  	def public_comment_permission
  		if not @public_comment_permission
		    @public_comment_permission = Permission.new('permission_id_14',2,nil,'public',2)
		end
		return @public_comment_permission
  	end

  	def public_edit_permission
  		if not @public_edit_permission
		    @public_edit_permission = Permission.new('permission_id_15',2,nil,'public',3)
		end
		return @public_edit_permission
  	end

  	def public_owner_permission
  		if not @public_owner_permission
		    @public_owner_permission = Permission.new('permission_id_16',2,nil,'public',5)
		end
		return @public_owner_permission
  	end
end

