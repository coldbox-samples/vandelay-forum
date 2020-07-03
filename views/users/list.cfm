<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <ul class="list-group">
        <cfloop query="prc.qryUsers">
            <li class="list-group-item">
                <a href="#event.buildLink( to='users.details', 
                                           queryString='userID=#prc.qryUsers.userID#' )#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a>
            </li>
        </cfloop>

        <!--- Now loop over the Admin users and draw them a well. --->
        <cfloop array="#prc.aryAdmins#" index="curPerson">
            <li class="list-group-item">#curPerson#</li>
        </cfloop>
    </ul>

    <cfif IsDefined( "rc.message" )>
        <p>#rc.message#</p>
    </cfif>

    <cfif IsDefined( "rc.showRouteInfo" )>
        <cfdump var="#event.getCurrentRouteName()#" label="event.getCurrentRouteName()" />
        <cfdump var="#event.getCurrentRoute()#" label="event.getCurrentRoute()" />
        <cfdump var="#event.getCurrentRoutedURL()#" label="event.getCurrentRoutedURL()" />
        <cfdump var="#event.getCurrentRoutedNamespace()#" label="event.getCurrentRoutedNamespace()" />
    </cfif>

</cfoutput>

