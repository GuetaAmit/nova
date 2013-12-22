#Storage.rb

require "sinatra"
require "sinatra/json"
require_relative "../Model/StorageModel"
require_relative "../Common/Common"


# Operations
################################

get '/storage/v1/folder/:folder_id' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# If the user asked the root
	if(params[:folder_id] == '0')
		return json rootlist
	end

	# If the user asked the first folder
	if(params[:folder_id] == 'folder_id_1')
		return json firstfolderlist
	end

	# If the user asked the second folder
	if(params[:folder_id] == 'folder_id_2')
		return json secondfolderlist
	end

	# If the user asked the second folder
	if(params[:folder_id] == 'folder_id_3')
		return json thirdfolderlist
	end

	# If we get here it mean that the user asked for non existing folder, that's an error
	halt render_error(:not_found, 'This folder id is not exist')
end

get '/storage/v1/file/:file_id' do

		# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	filelist.each { |file|
		if file.id == params[:file_id]
			@file = file
		end
	}

	if not @file
		# If we get here it mean that the user asked for non existing file, that's an error
		halt render_error(:not_found, 'This file id does not exist')
	else
		json @file
	end
end	

#CREATE FOLDER
################


post '/storage/v1/folders/:parent_folder_id' do
	
	# Check specific headers for the login
	check_headers(['X-Timestamp', 'X-Authorization-Version'])

	# Check parameters
	check_params(['name', 'privacy'])

	# Create the folder with paramters
	@newFolder = FolderEntity.new("folder_id_#{folderlist.length+1}", 0, params[:name], Time.now, Time.now, users[2].user_info, params[:privacy], false, true, 
									params[:parent_folder_id], nil, 0, 0, "no content")
	
	# Create a base folder to return ...		
	@returnFolder = BaseFolderListItemEntity.new("folder_id_#{folderlist.length+1}", 0, params[:name], Time.now, params[:privacy], false)		
	
	# Check the parent id and insert to correct Array accordingly
	if params[:parent_folder_id] == 0
		rootlist.push(@returnFolder)
	elsif params[:parent_folder_id] == 'folder_id_1'
		firstfolderlist.push(@returnFolder)
	elsif params[:parent_folder_id] == 'folder_id_2'
		secondfolderlist.push(@returnFolder)
	elsif params[:parent_folder_id] == 'folder_id_3'
		thirdfolderlist.push(@returnFolder)		
	end
	
	# Add newfolder to general folderlist
	folderlist.push(@newFolder)
	
	# Return the base folder		
	json @returnFolder
end
	





	


