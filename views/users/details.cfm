<cfoutput>
    <h1>User Details</h1>

    <cfif IsDefined( "rc.errors" )>
        <div class="alert alert-danger" role="alert">
            <cfloop array="#rc.errors#" index="curError">
                <p>#curError#</p>
            </cfloop>
        </div>
    </cfif>

    <cfif IsDefined( "prc.objUser" )>
        <form name="frmUser" id="frmUser" method="post" action="#event.buildLink( 'users.save' )#">
            <input type="hidden" name="userID" id="userID" value="#Val( prc.objUser.getuserID() )#" />
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" id="firstName" value="#prc.objUser.getfirstName()#" />
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" id="lastName" value="#prc.objUser.getlastName()#" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="Email" id="Email" value="#prc.objUser.getemail()#" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" value="#prc.objUser.getpassword()#" />
            </div>
            <div class="form-group">
                <input class="btn btn-primary" type="submit" name="btnSave" id="btnSave" value="Save" />
            </div>
        </form>
    </cfif>

    <div>
        <a href="#event.route( 'usermanager' )#">Back to List Page</a>
    </div>

</cfoutput>

