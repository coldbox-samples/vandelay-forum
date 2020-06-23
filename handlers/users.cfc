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
	

	property name="objUsers" inject="Users";

	// IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments )
	{
		// event.setLayout( 'plain' );
	}
/*
	function postHandler( event, rc, prc, action, eventArguments )
	{
	}

	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}

	function onMissingAction( event, rc, prc, missingAction, eventArguments )
	{
		log.error( "Missing Action! Somebody requested #arguments.missingAction#." );
		// abort;
		relocate( 'users.list' );
	}

	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}

	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
*/
	function list( event, rc, prc )
	{
		// var qryUsers = CreateObject( "component", "model.users" ).init().getUsers();
		// var qryUsers = new model.users().getUsers();
		// var qryUsers = getInstance( "Users" ).getUsers();

		// writedump( objUsers );
		// abort;

		var qryUsers = objUsers.getUsers();

		prc.qryUsers = qryUsers;
	}
		
	function details( event, rc, prc )
	{
		var qryUserDetails = getInstance( "Users" ).getUserDetails( rc.userID );
		rc.qryUserDetails = qryUserDetails;
	}
	
	function save( event, rc, prc )
	{
		// did we get a Headshot uploaded?
		if( rc.headshot.len() gt 0 )
		{
			announceInterception( "uploadPhoto" );
			abort;
		}

		var rslt = getInstance( "Users" ).saveUser( Val( rc.userID ), 
													rc.firstName, 
													rc.lastName, 
													rc.Email, 
													rc.Password );

		relocate( event="users.list" );
	}
}
