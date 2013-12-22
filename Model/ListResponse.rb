# ListResponse.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"

class ListResponse < Jsonable
	
	# Define getters to all of the params
	attr_reader :entries, :pagination

	# Ctor
	def initialize(entries_name, entries, pagination)
        instance_variable_set("@#{entries_name}", entries)
        @pagination = pagination
	end
end