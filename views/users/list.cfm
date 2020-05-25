<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <ul>
        <cfloop query="prc.qryUsers">
            <!--- <li><a href="index.cfm?event=users.details&userID=#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a></li> --->

            <!--- <li><a href="/users/details/userID/#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a></li> --->

            <!--- <li><a href="#event.buildLink( to='users.details' )#?userID=#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a></li> --->

            <li><a href="#event.buildLink( to='users.details', 
                                           queryString='userID=#prc.qryUsers.userID#' )#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a></li>
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

