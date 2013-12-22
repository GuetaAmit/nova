# MemberModel.rb

require "sinatra"
require "sinatra/json"
require_relative "../Model/UsersModel"
require_relative "../Model/BaseEntityModel"

class MemberResponse < BaseEntity
	
	# Define getters to all of the params
	attr_reader :member_info, :user_joindate, :user_status, :user_permission

	# Ctor
	def initialize(id, user, joindate, status, permission)
		@id = id
		@member_info = user
		@member_joindate = joindate
		@member_status = status
		@member_permission = permission
	end
end

helpers do
  def members
  		if not @members
		    @members = Array[
				MemberResponse.new("0", users[0], '2010-12-02T16:17:52.023Z', '1', '3'),
				MemberResponse.new("1", users[1], '2010-11-02T16:17:52.023Z', '1', '2'),
				MemberResponse.new("2", users[2], '2010-10-02T16:17:52.023Z', '1', '1')
			]
		end
		return @members
  	end
 end 	