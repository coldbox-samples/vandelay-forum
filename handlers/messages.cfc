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
		// var objMessages = createObject( 'component', 'models.Messages' ).init();
		// var objMessages = new models.Messages();
		var objMessages = getInstance( 'Messages' );

		prc.qMessages = objMessages.read();

		event.setView( "messages/list" );
	}

	/**
	* detail
	*/
	function detail( event, rc, prc )
	{
		param name="rc.MessageID" default="0" type="numeric";

		var objMessages = getInstance( 'Messages' );
		var objUsers    = getInstance( "Users" );

		prc.qUsers = objUsers.getUsers();
		prc.qMessage = objMessages.read( rc.MessageID ?: 0 );

		event.setView( "messages/detail" );
	}

	function save( event, rc, prc )
	{
		if( rc.MessageID eq 0 )
		{
			getInstance( "Messages" ).create( rc.UserID, rc.MessageBody, rc.Subject, rc.dateTimeCreated )
		}
		else if( rc.MessageID gt 0 )
		{
			getInstance( "Messages" ).update( rc.MessageID, rc.UserID, rc.MessageBody, rc.Subject, rc.dateTimeCreated )
		}

		relocate( event="messages.list" );
	}

	function delete( event, rc, prc )
	{
		getInstance( "Messages" ).delete( rc.MessageID );
		relocate( event="messages.list" );
	}
	
}
