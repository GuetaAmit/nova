# StorageModel.rb


require "sinatra"
require "sinatra/json"
require_relative "../Model/BaseEntityModel"
require_relative "../Model/PermissionModel"
require_relative "../Model/ActionModel"
require_relative "../Model/ListResponse"
require_relative "../Common/Common"




# Classes
################################

class BaseFolderListItemEntity < Jsonable

	# Define getters to all of the params
	attr_reader :id, :type, :name, :modified, :privacy, :is_favorite

	# Ctor
	def initialize(id, type, name, modified, privacy, is_favorite)
		@id = id
		@type = type
		@name = name
		@modified = modified
		@privacy = privacy
		@is_favorite = is_favorite
	end
end

class StorageEntity < BaseEntity

	# Define getters to all of the params
	attr_reader :offline, :parent, :permissions, :is_favorite

	# Ctor
	def initialize(id, type, name,created, modified, owner, privacy, is_favorite, offline,parent,permissions)
		super(id, type, name, created, modified, owner, privacy)
		@offline = offline
		@parent = parent
		@permissions = permissions
		@is_favorite = is_favorite
	end
end

class FolderEntity < StorageEntity

	# Define getters to all of the params
	attr_reader :num_of_files, :num_of_folders, :content, :offline, :parent, :permissions, :is_favorite, :id, :type, :name, :modified, :privacy, :owner, :created
#	attr_reader :is_favorite, :id, :type, :name, :modified, :privacy

	# Ctor
	def initialize(id, type, name, created, modified, owner, privacy, is_favorite, offline, parent, permissions,
				num_of_files, num_of_folders, content)
		super(id, type, name,created, modified, owner, privacy, is_favorite, offline, parent, permissions)
		@num_of_files = num_of_files
		@num_of_folders = num_of_folders
		@content = content
	end
end

class ReturnFolderEntity < StorageEntity

	# Define getters to parameters
	attr_reader :id, :type, :name, :modified, :privacy, :is_favorite
	
	# Ctor
	def initialize(id, type, name, modified, privacy, is_favorite)
		super(id, type, name, nil, modified, nil, privacy, is_favorite, nil, nil, nil)
	end
end	

class FileEntity < StorageEntity

	# Define getters to all of the params
	attr_reader :thumbnail, :mime_type, :app, :size, :comments, 
				:likes, :views, :can_download, :can_view, :can_comment,
				:can_edit, :offline, :parent, :permissions, :is_favorite,:id, :type, :name, :modified, :privacy, :owner, :created

	# Ctor
	def initialize(id, type, name, created, modified, owner, privacy, is_favorite, offline, parent, permissions,
				thumbnail, mime_type, app, size, comments, 
				likes, views, can_download, can_view, can_comment,can_edit)
		super(id, type, name, created, modified, owner, privacy, is_favorite, offline, parent, permissions)
		@thumbnail = thumbnail
		@mime_type = mime_type
		@app = app
		@size = size
		@comments = comments
		@likes = likes
		@views = views
		@can_download = can_download
		@can_view = can_view
		@can_comment = can_comment
		@can_edit = can_edit
	end
end


# Global Helper
################################
helpers do
	#folders

	def first_folder
		if not @first_folder
			@first_folder = FolderEntity.new('folder_id_1',0,'first_folder','2010-12-02T16:17:52.023Z',
				'2010-12-02T16:17:52.023Z',users[2].user_info,2,false, true, '0', nil, 0, 0, 'empty')
		end
		return @first_folder
	end

	def second_folder
		if not @second_folder
			@second_folder = FolderEntity.new('folder_id_2',0,'second_folder','2010-12-02T16:17:52.023Z',
				'2010-12-02T16:17:52.023Z',users[1].user_info,1,false, true, '0', Array[public_view_permission, b_user_owner_permission], 
				2, 1, '3 items folder')
		end
		return @second_folder
	end

	def third_folder
		if not @third_folder
			@third_folder = FolderEntity.new('folder_id_3',0,'third_folder','2010-12-02T16:17:52.023Z',
				'2010-12-02T16:17:52.023Z',users[0].user_info,2,false, true, second_folder.id, nil, 1, 0, '2 items folder')
		end
		return @third_folder
	end

	#files

	def first_file
		  	if not @first_file

		    @first_file = FileEntity.new('file_id_1',1,'first_file','2010-12-02T16:17:52.023Z','2010-12-02T16:17:52.023Z',
		    	                         users[0].user_info,2,true, true, '0', Array[a_user_owner_permission, b_user_view_permission],
		    	                         'pic_1', 'dwg', 2, 20, Array[c_user_comment, b_user_comment], Array[c_user_like], 22,
		    	                         true, true, true, true)
		end
		return @first_file
  	end

  	def second_file
		  	if not @second_file

		    @second_file = FileEntity.new('file_id_2',1,'second_file','2010-12-02T16:17:52.023Z','2010-12-02T16:17:52.023Z',
		    	                         users[1].user_info,1,true, true, '0', Array[b_user_owner_permission, c_user_edit_permission, public_view_permission],
		    	                         'pic_2', 'dwg', 2, 30, nil, Array[c_user_like, a_user_like], 25,
		    	                         true, true, false, true)
		end
		return @second_file
  	end

  	def third_file
		  	if not @third_file

		    @third_file = FileEntity.new('file_id_3',1,'third_file','2010-12-02T16:17:52.023Z','2010-12-02T16:17:52.023Z',
		    	                         users[2].user_info,0,false, false, second_folder.id, nil, 'pic_3', 'dwg', 2, 35, nil, nil, 0, false, false, false, false)
		end
		return @third_file
  	end

  	def fourth_file
		  	if not @fourth_file

		    @fourth_file = FileEntity.new('file_id_4',1,'fourth_file','2010-12-02T16:17:52.023Z','2010-12-02T16:17:52.023Z',
		    	                         users[0].user_info,1,false, false, second_folder.id, nil, 'pic_3', 'dwg', 2, 35, nil, nil, 0, false, false, false, false)
		end
		return @fourth_file
  	end

  	def fifth_file
		  	if not @fifth_file

		    @fifth_file = FileEntity.new('file_id_5',1,'fifth_file','2010-12-02T16:17:52.023Z','2010-12-02T16:17:52.023Z',
		    	                         users[1].user_info,1,true, true, third_folder.id, Array[c_user_edit_permission, public_edit_permission],
		    	                         'pic_2', 'dwg', 2, 30, nil, Array[c_user_like, a_user_like], 5,
		    	                         true, false, false, true)
		end
		return @fifth_file
  	end

  	def filelist
  		if not @filelist
  			@filelist = Array[first_file, second_file, third_file, fourth_file, fifth_file]
  		end
  		return @filelist
  	end
  	
  	def folderlist
  		if not @folderlist
  			@folderlist = Array[first_folder, second_folder, third_folder]
  		end
  		return @folderlist
  	end

  	def rootlist
  		if not @rootlist

		    @rootlist = ListResponse.new("storage", Array[
				BaseFolderListItemEntity.new(first_folder.id,first_folder.type,first_folder.name,
											first_folder.modified,first_folder.privacy,first_folder.is_favorite),
				BaseFolderListItemEntity.new(first_file.id,first_file.type,first_file.name,
											first_file.modified,first_file.privacy,first_file.is_favorite),
		    	BaseFolderListItemEntity.new(second_folder.id,second_folder.type,second_folder.name,
											second_folder.modified,second_folder.privacy,second_folder.is_favorite),
		    	BaseFolderListItemEntity.new(second_file.id,second_file.type,second_file.name,
											second_file.modified,second_file.privacy,second_file.is_favorite)
			],PaginationEntity.new('file_id_2','.../?max_id=file_id_2'))
		end
		return @rootlist
  	end

  	 def firstfolderlist
  		if not @firstfolderlist
		    @firstfolderlist = ListResponse.new("storage", Array[],nil)
		end
		return @firstfolderlist
  	end

  	def secondfolderlist
  		if not @secondfolderlist
		    @secondfolderlist = ListResponse.new("storage", Array[
				BaseFolderListItemEntity.new(third_folder.id,third_folder.type,third_folder.name,
											third_folder.modified,third_folder.privacy,third_folder.is_favorite),
				BaseFolderListItemEntity.new(third_file.id,third_file.type,third_file.name,
											third_file.modified,third_file.privacy,third_file.is_favorite),
		    	BaseFolderListItemEntity.new(fourth_file.id,fourth_file.type,fourth_file.name,
											fourth_file.modified,fourth_file.privacy,fourth_file.is_favorite)
			],PaginationEntity.new('file_id_4','.../?max_id=file_id_4'))
		end
		return @secondfolderlist
  	end

  	 def thirdfolderlist
  		if not @thirdfolderlist
		    @thirdfolderlist = ListResponse.new("storage", Array[
				BaseFolderListItemEntity.new(fifth_file.id,fifth_file.type,fifth_file.name,
											fifth_file.modified,fifth_file.privacy,fifth_file.is_favorite)
			],PaginationEntity.new('file_id_5','.../?max_id=file_id_5'))
		end
		return @thirdfolderlist
  	end
end

