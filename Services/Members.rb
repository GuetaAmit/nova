# Members.rb

require "sinatra"
require "sinatra/json"
require_relative "../Common/Common"
require_relative "../Model/MemberModel"
require_relative "../Model/ProjectModel"

# Operations
################################

get '/projects/v1/project/:project_id/members/' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['project_id'])
	
	# Search for the project in projects
	projects.each { |project|
		if project.id == params[:project_id]
			@project = project
		end
	}
	
	if @project
		json @project.members
	end
end
