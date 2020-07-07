component 
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";
    property name="populator" inject="wirebox:populator";

    public UserService function init()
    {
        return this;
    }

    public query function getUsers()
    {
        var sql = "SELECT userID, firstName, lastName, Email, Password FROM tUser";
        var rslt = queryExecute( sql, {}, { datasource: dsn.name } );
        return rslt;
    }

    public Users function getUserDetails( userID )
    {
        var sql = "SELECT userID, firstName, lastName, Email, Password FROM tUser WHERE userID = :userID";
        var rslt = queryExecute( sql, { userID = arguments.userID }, { datasource: dsn.name } );
        
        var objUser = new Users();

        // objUser.setUserID( rslt.userID );
        // objUser.setFirstName( rslt.firstName );
        // objUser.setLastName( rslt.lastName );
        // objUser.setEmail( rslt.email );
        // objUser.setPassword( rslt.password );        

        objUser = populator.populateFromQuery( target=objUser, qry=rslt );
        return objUser;
    }

    public Users function saveUser( objUser )
    {
        var mode = "";

        if( IsNumeric( objUser.getuserID() ) && objUser.getuserID() > 0 )
        {
            var sql = "UPDATE tUser 
                          SET FirstName = :firstName, 
                              lastName = :lastName, 
                              email = :email, 
                              Password = :Password 
                        WHERE userID = :userID";

            mode = "update";
        }
        else 
        {
            var sql = "INSERT INTO tUser ( firstName, 
                                           lastName, 
                                           Email, 
                                           Password ) 
                                         VALUES
                                          (
                                            :firstName,
                                            :lastName,
                                            :Email,
                                            :Password
                                          )";
            mode = "insert";
        }

        var rslt = queryExecute( sql, { userID = objUser.getuserID(),
                                        firstName = objUser.getfirstName(),
                                        lastName = objUser.getlastName(),
                                        email = objUser.getemail(),
                                        password = objUser.getpassword()
                                      }, 
                                      { datasource: dsn.name, result="userInfo" } );

        var objUser = new Users();
        if( mode eq "update" )
        {
            objUser.setUserID( objUser.getuserID() );
        }
        else if( mode eq "insert" )
        {
            objUser.setUserID( userInfo.generatedKey );
        }

        return objUser;
    }    
}