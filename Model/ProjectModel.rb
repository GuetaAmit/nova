# ProjectModel.rb

require "sinatra"
require "sinatra/json"
require_relative "../Model/PaginationModel"
require_relative "../Model/BaseEntityModel"
require_relative "../Model/ListResponse"
require_relative "../Common/Common"

class Project < BaseEntity

 # Define getters to all of the params
	 attr_reader :description, :thumbnail, :num_of_memebers, :members, :num_of_files, :num_of_folders, :content, :stream
	 
 # Ctor
  def initialize(id, type, name, created, modified, owner, privacy, description, 
  	thumbnail, num_of_memebers, members, num_of_files, num_of_folders, content, stream)
    super(id, type, name, created, modified, owner, privacy)
 	@description = description
 	@thumbnail = thumbnail	 
 	@num_of_memebers = num_of_memebers
 	@members = members
 	@num_of_files = num_of_files
 	@num_of_folders = num_of_folders
 	@content = content
 	@stream = stream
  end
end

# Global Helper
################################

helpers do
  	
  	def projects
    	if not @projects
        	@projects = Array[
        		Project.new('project_id_1', -1, 'FirstProject', '2013-12-01T17:10:52.023Z',
                    '2013-12-02T16:17:52.023Z', users[0], 0, 'This is the first project ever created',
                    'http://www.animatorkel.com/b2/uploaded_images/CityPlace_Seven_STILL_D-743120.jpg', 2, Array[members[1], members[2]], 3, 5, first_folder, nil),
            	Project.new('project_id_2', -1, 'SecondProject', '2013-12-08T18:10:52.023Z',
                    '2013-12-09T16:17:52.023Z', users[1], 0, 'This is the second project',
                    'http://swaleff.files.wordpress.com/2010/10/modo3.jpg', 3, Array[members[1]], 3, 5, second_folder, nil),
            	Project.new('project_id_3', -1, 'ThirdProject', '2013-12-08T19:10:52.023Z',
                    '2013-12-20T16:17:52.023Z', users[2], 0, 'This is the third project',
                    'http://st.depositphotos.com/1001877/2059/i/950/depositphotos_20592431-Residential-house-on-architect-blueprints.-Housing-project..jpg', 1, Array[members[2]], 4, 1, third_folder, nil)
                    ]
        end
		return @projects
	end
end	

	