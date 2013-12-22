#Projects.rb

require "sinatra"
require "sinatra/json"
require_relative "../Model/BaseEntityModel"
require_relative "../Model/ListResponse"


get '/projects/v1/:user_id' do

	# Check params
	check_params(['user_id'])

    # Check that user exist
    users.each {|user|
        if user.user_info.id == (params[:user_id])
            @exist = true;
         end
    }
    
    # If there isn't a user, that's an error
	if not @exist
		halt render_error(:invalid_value, 'user_id not found')
    else
        projects_for_users = Array.new

        # Iterate project
        projects.entries.each { |project|
            # Search for this user in project member
            project.members.each {|member|
                if member.member_info.user_info.id == (params[:user_id])
                    projects_for_users.push(project)
                end
            }
        }
	
        # Create list response with projects entry
        if projects_for_users.size > 0
            json ListResponse.new("projects", projects_for_users, 
            PaginationEntity.new(projects_for_users.last.id,'.../?max_id=' + projects_for_users.last.id))
            else
            json ListResponse.new("projects", Array.new, nil)
        end
    end
end

get '/projects/v1/project/:project_id/members' do
    
    # Check params
    check_params (['project_id'])
    
    # Get memebers for project
    
    projects.entries.each {|project|
        if project.id == (params[:project_id])
        
        	
            # Create list response with members array
            # json ListResponse.new("members", project.members, 
            # PaginationEntity.new("some_project_id", '.../?max_id= some_project_id'))  
            # @exist = true;
           	@members_array = project.members
        end
    }
    
    # If there isn't project, that's an error
    if @members_array && @members_array.size > 0
    	json ListResponse.new("members", @members_array, 
            PaginationEntity.new(@members_array.last.id,'.../?max_id=some_last_id'))  
    else	
        halt render_error(:invalid_value, 'project')
    end
end




	


