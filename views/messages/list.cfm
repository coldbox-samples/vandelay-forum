<cfoutput>
    <h1>Messages</h1>

    <a href="#event.buildLink( 'messages.detail' )#">Add New Message</a>

    <table class="table">
        <thead>
            <tr>
                <th>Date</th>
                <th>Subject</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="prc.qMessages">
                <tr>
                    <td>#prc.qMessages.dateTimeCreated#</td>
                    <td>#prc.qMessages.subject#</td>
                </tr>
            </cfloop>
        </tbody>
    </table>

</cfoutput>