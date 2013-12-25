AMIT!!???! Welcome to RUBY - TESTING - SERVER!
=======================

The testing        grounds for A360 development.
This RUBY server will mimic the external server to which we connect to test diffferent aspects of the SDK development.

To launch the server use:<br/>
***ruby Nova.rb -o 0.0.0.0***

We use -o 0.0.0.0 to allow communications from all interfaces and not only the localhost of the machine running the code.
This solves an issue that occurs when a device is connected to the computer running the code. Each has a local host and ruby can not know which one 
is allowed to connect.

##GET/POST calls:##


-- **/users/v1/login?** (POST)<br/> 
Providing a username (comprised of an email) and password, a user can login<br/>
*Requiers: username, password*


-- **/users/v1/register?** (POST)<br/>
Registers a user on the server. Currently n/a.<br/>
*Requiers: username, password, first_name, last_name*


-- **/projects/v1/project/:project_id/members/** (GET)<br/>
Will return all memebers that have permissions in a specific project.<br/>
*Requiers: project_id*


-- **/projects/v1/:user_id** (GET)<br/>
Will return all projects currently associated with a specific user.<br/>
*Requiers: user_id*


-- **/storage/v1/folder/:folder_id** (GET)<br/>
Will return the content of a specific folder<br/>
*Requiers: folder_id*


-- **/storage/v1/file/:file_id** (GET)<br/>
Will return information on a specific file<br/>
*Requiers: file_id*


-- **/storage/v1/folders/:parent_folder_id** (POST)<br/>
Will return all subfolders residing inside a parent folder<br/>
*Requiers: parent_folder_id*





