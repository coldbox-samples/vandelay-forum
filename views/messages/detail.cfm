<cfoutput>
<h1>messages.detail</h1>
</cfoutput>



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
