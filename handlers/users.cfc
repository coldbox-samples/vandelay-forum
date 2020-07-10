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
		param name="rc.userType" default="";

		param name="rc.searchingfor" default="";

		rc.aryUsers = new models.Users().getUsers();

		if( IsDefined( "rc.addMe" ) )
		{
			rc.aryUsers.append( rc.addMe );
		}
	}
		
	function details( event, rc, prc )
	{
		rc.person = "Nolan";
		prc.favoriteColor = "green";

		WriteDump( rc );
		WriteDump( prc );
		WriteDump( event.getPrivateCollection() );
	}
	
}
