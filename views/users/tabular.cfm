<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <table class="table">
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
            </tr>
        </thead>
        <tbody>
            <cfloop query="#prc.qryUsers#">
                <tr>
                    <td>#prc.qryUsers.firstName#</td>
                    <td>#prc.qryUsers.lastName#</td>
                </tr>
            </cfloop>
        </tbody>
    </table>

    <cfif IsDefined( "rc.message" )>
        <p>#rc.message#</p>
    </cfif>

</cfoutput>

