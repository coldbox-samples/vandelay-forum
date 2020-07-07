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
	
	function list( event, rc, prc )
	{
		var qryUsers = getInstance( "UserService" ).getUsers();

		prc.qryUsers = qryUsers;
	}
		
	function details( event, rc, prc )
	{
		var objUser = getInstance( "UserService" ).getUserDetails( rc.userID );
		prc.objUser = objUser;
	}
	
	function save( event, rc, prc )
	{
		// var rslt = getInstance( "Users" ).saveUser( Val( rc.userID ), 
		// 											rc.firstName, 
		// 											rc.lastName, 
		// 											rc.Email, 
		// 											rc.Password );

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
			getInstance( "UserService" ).saveUser( objUser );
			relocate( event="users.list" );			
		}

	}
}
