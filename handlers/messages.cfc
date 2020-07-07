/**
* I am a new handler
*/
component{
	
	property name="html" inject="HTMLHelper@coldbox";
	property name="objMessages" inject="Messages";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};
			
	property name="objMessageService" inject="MessageService";
	property name="objUserService" inject="UserService";

	/**
	* list
	*/
	function list( event, rc, prc )
	{
		prc.qMessages = objMessageService.read();
		event.setView( "messages/list" );
	}

	/**
	* detail
	*/
	function detail( event, rc, prc )
	{
		param name="rc.MessageID" default="0" type="numeric";

		prc.qUsers = objUserService.getUsers();
		prc.objMessage = objMessageService.read( rc.MessageID ?: 0 );

		event.setView( "messages/detail" );
	}

	function save( event, rc, prc )
	{
		var objMessage = populateModel( model='messages' );
		var validationResults = validateModel( objMessage );

		if( validationResults.hasErrors() )
		{
			var errors = validationResults.getAllErrors();
			relocate( event="messages.detail", 
					  queryString="messageID=#rc.messageID#", 
					  persistStruct={ messageID: rc.messageID, errors: errors } );

			if( rc.MessageID eq 0 )
			{
				objMessageService.create( rc.UserID, rc.MessageBody, rc.Subject, rc.dateTimeCreated )
			}
			else if( rc.MessageID gt 0 )
			{
				objMessageService.update( rc.MessageID, rc.UserID, rc.MessageBody, rc.Subject, rc.dateTimeCreated )
			}
	
			relocate( event="messages.list" );
		}
		else 
		{
			objUserService.saveUser( objUser );
			relocate( event="users.list" );			
		}
	}

	function delete( event, rc, prc )
	{
		objMessageService.delete( rc.MessageID );
		relocate( event="messages.list" );
	}
	
}
