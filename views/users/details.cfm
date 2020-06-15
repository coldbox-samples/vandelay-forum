<cfoutput>
    <h1>User Details</h1>

    <cfif IsDefined( "rc.qryUserDetails" )>
        <form name="frmUser" id="frmUser" method="post" action="#event.buildLink( 'users.save' )#">
            <!--- <input type="hidden" name="userID" id="userID" value="#Val( rc.qryUserDetails.userID )#" /> --->
            #html.inputField( type='hidden', name='userID', value=Val( rc.qryUserDetails.userID ) )#

            <div class="form-group">
                <!--- <label for="firstName">First Name</label> --->
                #html.label( field="firstName", content="First Name" )#

                <!--- <input type="text" name="firstName" id="firstName" value="#rc.qryUserDetails.firstName#" /> --->
                #html.inputField( type='text', 
                                  name='firstName', 
                                  class='myformcontrol',
                                  tabindex=1,
                                  value=rc.qryUserDetails.firstName )#
            </div>
            <div class="form-group">
                <!--- <label for="lastName">Last Name</label> --->
                #html.label( field="lastName", content="Last Name")#

                <!--- <input type="text" name="lastName" id="lastName" value="#rc.qryUserDetails.lastName#" /> --->
                #html.inputField( type='text', name='lastName', value=rc.qryUserDetails.lastName )#
            </div>
            <div class="form-group">
                <!--- <label for="email">Email</label> --->
                #html.label( field="email", content="Email")#

                <!--- <input type="email" name="Email" id="Email" value="#rc.qryUserDetails.email#" /> --->
                #html.inputField( type='email', name='Email', value=rc.qryUserDetails.email )#
            </div>
            <div class="form-group">
                <!--- <label for="password">Password</label> --->
                #html.label( field="email", content="Email")#

                <!--- <input type="password" name="password" id="password" value="#rc.qryUserDetails.password#" /> --->
                #html.inputField( type='password', name='password', value=rc.qryUserDetails.password )#
            </div>
            <div class="form-group">
                <!--- <input class="btn btn-primary" type="submit" name="btnSave" id="btnSave" value="Save" /> --->
                #html.inputField( type='submit', class="btn btn-primary", name='btnSave', value='Save' )#
            </div>
        </form>
    </cfif>

    <div>
        <a href="#event.route( 'usermanager' )#">Back to List Page</a>
    </div>

</cfoutput>

