/**
* I am a new handler
*/
component{
	
	property name="html" inject="HTMLHelper@coldbox";

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
		
	/**
	* list
	*/
	function list( event, rc, prc )
	{
		// var qMessages = new models.Messages();
		var objMessages = getInstance( 'Messages' );

		//writedump( qMessages );

		prc.qMessages = objMessages.read();

		event.setView( "messages/list" );
	}

	/**
	* detail
	*/
	function detail( event, rc, prc )
	{
		var objMessages = getInstance( 'Messages' );
		var objUsers    = getInstance( "Users" );

		prc.qUsers = objUsers.getUsers();
		prc.qMessage = objMessages.read( rc.MessageID ?: 0 );

		event.setView( "messages/detail" );
	}


	
}
