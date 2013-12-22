# BaseEntityModel.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"

# Classes
################################

class BaseEntity < Jsonable

	# Define getters to all of the params
	attr_reader :id, :type, :name, :created ,:modified, :owner, :privacy 

	# Ctor
	def initialize(id, type, name, created, modified, owner, privacy)
		@id = id
		@type = type
		@name = name
		@created = created
		@modified = modified
		@owner = owner
		@privacy = privacy
	end
end



