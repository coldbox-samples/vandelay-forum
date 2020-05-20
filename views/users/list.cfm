<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <ul>
        <cfloop array="#prc.aryUsers#" item="u">
            <li>#u.firstName# #u.lastName#</li>
        </cfloop>
    </ul>

    <cfif IsDefined( "rc.message" )>
        <p>#rc.message#</p>
    </cfif>

</cfoutput>

