<cfoutput>
    <h1>Welcome to my cool module page!</h1>

    <h3>Admin Users</h3>

    <ul>
        <cfloop array="#prc.aryAdmins#" index="user">
            <li>#user#</li>
        </cfloop>
    </ul>
</cfoutput>