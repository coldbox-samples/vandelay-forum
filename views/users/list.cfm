<cfoutput>
    <h1>#getSetting( 'companyName' )# Users</h1>

    <cfset sayHello() />

    <ul class="list-group">
        <cfloop query="prc.qryUsers">
            <li class="list-group-item">
            <!--- <a href="index.cfm?event=users.details&userID=#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a> --->

            <!--- <a href="/users/details/userID/#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a> --->

            <!--- <a href="#event.buildLink( to='users.details' )#?userID=#prc.qryUsers.userID#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a> --->

                <a href="#event.buildLink( to='users.details', 
                                           queryString='userID=#prc.qryUsers.userID#' )#">#prc.qryUsers.firstName# #prc.qryUsers.lastName#</a>
            </li>
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

    <cfset sayGoodBye() />

</cfoutput>

