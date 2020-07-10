<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <div>
        <cfif Len( rc.userType )>
            Users from the #rc.userType# team.
        </cfif>

        <cfif Len( rc.searchingfor )>
            Searching for users from the #rc.searchingfor# team.
        </cfif>

    </div>

    <ul>
        <cfloop array="#rc.aryUsers#" item="u">
            <li>#u#</li>
        </cfloop>
    </ul>

</cfoutput>

