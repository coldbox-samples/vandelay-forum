<cfoutput>
    <h1>User Details</h1>

    <cfif IsDefined( "rc.qryUserDetails" )>
        <form name="frmUser" id="frmUser">
            <div>
                <label for="firstName">First Name</label>
                <input type="text" name="firstName" id="firstName" value="#rc.qryUserDetails.firstName#" />
            </div>
            <div>
                <label for="lastName">Last Name</label>
                <input type="text" name="lastName" id="lastName" value="#rc.qryUserDetails.lastName#" />
            </div>
            <div>
                <input type="submit" name="btnSave" id="btnSave" value="Save" />
            </div>
        </form>
    </cfif>

    <div>
        <a href="#event.route( 'usermanager' )#">Back to List Page</a>
    </div>

</cfoutput>

