# PaginationModel.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"


class PaginationEntity < Jsonable
	
	# Define getters to all of the params
	attr_reader :next_max_id, :next_url

	# Ctor
	def initialize(next_max_id, next_url)
		@next_url = next_url
		@next_max_id = next_max_id
	end
end