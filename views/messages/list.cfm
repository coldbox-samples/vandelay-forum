<cfoutput>
    <h1>Messages</h1>

    <a href="#event.buildLink( 'messages.detail' )#">Add New Message</a>
    <a href="#event.buildLink( 'MyAdminTools:home.index' )#">Go To Admin Tools</a>

    <table class="table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Author</th>
                <th>Subject</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="prc.qMessages">
                <tr>
                    <td>#DateFormat( prc.qMessages.dateTimeCreated, 'mm/dd/yyyy' )#</td>
                    <td>#prc.qMessages.UserID#</td>
                    <td><a href="#event.buildLink( 'messages.detail' )#/MessageID/#prc.qMessages.MessageID#">#prc.qMessages.subject#</a></td>
                    <td><a href="#event.buildLink( 'messages.delete' )#/MessageID/#prc.qMessages.MessageID#">delete</a></td>
                </tr>
            </cfloop>
        </tbody>
    </table>

</cfoutput>