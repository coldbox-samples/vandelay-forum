<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
        </thead>
        <tbody>
            <cfloop array="#prc.aryUsers#" item="u">
                <tr>
                    <td>#u.firstName#</td>
                    <td>#u.lastName#</td>
                </tr>
            </cfloop>
        </tbody>
    </table>

    <cfif IsDefined( "rc.message" )>
        <p>#rc.message#</p>
    </cfif>

</cfoutput>

