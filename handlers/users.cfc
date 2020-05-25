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
	
	/**
	IMPLICIT FUNCTIONS: Uncomment to use
	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

	function list( event, rc, prc )
	{
		var qryUsers = getInstance( "Users" ).getUsers();
		prc.qryUsers = qryUsers;

		// event.setView( 'users/tabular' );
		// event.setView( view='users/tabular', layout='newbootstrap' );
		// event.setView( view='users/tabular', nolayout="true" );
	}
		
	function details( event, rc, prc )
	{
		var qryUserDetails = getInstance( "Users" ).getUserDetails( rc.userID );
		rc.qryUserDetails = qryUserDetails;
	}
	
	function save( event, rc, prc )
	{
		var rslt = getInstance( "Users" ).saveUser( Val( rc.userID ), 
													rc.firstName, 
													rc.lastName, 
													rc.Email, 
													rc.Password );

		// relocate( event="users.list" );
		// relocate( event="users.list", querystring="saved=1" );
		// relocate( url="https://ortussolutions.com" );
		// relocate( uri="/users/list" );
	}
}
