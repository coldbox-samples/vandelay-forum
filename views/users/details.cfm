<cfoutput>
    <h1>User Details</h1>

    <cfif IsDefined( "rc.qryUserDetails" )>
        <form name="frmUser" id="frmUser" method="post" action="#event.buildLink( 'users.save' )#" enctype="multipart/form-data">
            <input type="hidden" name="userID" id="userID" value="#Val( rc.qryUserDetails.userID )#" />
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" id="firstName" value="#rc.qryUserDetails.firstName#" />
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" id="lastName" value="#rc.qryUserDetails.lastName#" />
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="Email" id="Email" value="#rc.qryUserDetails.email#" />
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" value="#rc.qryUserDetails.password#" />
            </div>
            <div class="form-group">
                <label for="headshot">Headshot</label>
                <input type="file" name="headshot" id="headshot" value="" />
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

