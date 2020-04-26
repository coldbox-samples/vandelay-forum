<cfoutput>
    <h1>User Details</h1>

    <cfif IsDefined( "rc.person" )>
        <p>Hello, #rc.person#!</p>
    </cfif>

</cfoutput>

