/**
* I am a new handler
*/
component{
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	property name="objUserService" inject="userService";
	
	function list( event, rc, prc )
	{
		var qryUsers = objUserService.getUsers();

		prc.qryUsers = qryUsers;
	}
		
	function details( event, rc, prc )
	{
		var objUser = objUserService.getUserDetails( rc.userID );
		prc.objUser = objUser;
	}
	
	function save( event, rc, prc )
	{
		var objUser = populateModel( model='users' );

		var validationResults = validateModel( objUser );

		if( validationResults.hasErrors() )
		{
			var errors = validationResults.getAllErrors();
			relocate( event="users.details", 
					  queryString="userID=#rc.userID#", 
					  persistStruct={ userID: rc.userID, errors: errors } );
		}
		else 
		{
			objUserService.saveUser( objUser );
			relocate( event="users.list" );			
		}

	}
}
