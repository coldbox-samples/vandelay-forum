<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <ul>
        <cfloop array="#rc.aryUsers#" item="u">
            <li>#u#</li>
        </cfloop>
    </ul>

</cfoutput>

