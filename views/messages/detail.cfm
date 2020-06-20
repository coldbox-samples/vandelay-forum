<cfoutput>
    <h1>Message Details</h1>

    <form name="frmDetails" id="frmDetails" method="post" action="#event.buildLink( 'messages.save' )#">
        #html.inputField( type='hidden', name='MessageID', value=Val( prc.qMessage.MessageID ) )#

        <div class="form-group">
            #html.label( field="subject", content="Subject" )#
        
            #html.inputField( type='text', 
                              name='subject', 
                              value=prc.qMessage.Subject )#
        </div>

        <div class="form-group">
            #html.label( field="dateTimeCreated", content="Date" )#
        
            #html.inputField( type='text', 
                              name='dateTimeCreated', 
                              value=prc.qMessage.dateTimeCreated )#
        </div>
        
        <div class="form-group">
            #html.label( field="MessageBody", content="Message" )#

            #html.textArea( name="MessageBody", value=prc.qMessage.MessageBody )#
        </div>

        <div class="form-group">
            #html.label( field="UserID", content="Author" )#

            <select name="userID" id="userID">
                <option value="">No Author Found</option>
                <cfloop query="prc.qUsers">
                    <option value="#prc.qUsers.UserID#"
                        #rc.MessageID eq prc.qMessage.UserID ? 'selected' : ''#>
                        #prc.qUsers.firstName# #prc.qUsers.lastName#
                    </option>
                </cfloop>
            </select>
        </div>

        <div>
            <input type="submit" class="btn btn-primary" name="btnSave" value="Save" />
        </div>
    </form>

</cfoutput>

