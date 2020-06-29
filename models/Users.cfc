component accessors='true'
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";

    property name="userID";
    property name="firstName";
    property name="lastName";
    property name="Email";
    property name="Password";

    public any function init()
    {
        return this;
    }

    public query function getUsers()
    {
        var sql = "SELECT userID, firstName, lastName, Email, Password FROM tUser";
        var rslt = queryExecute( sql, {}, { datasource: dsn.name } );
        return rslt;
    }

    public query function getUserDetails( userID )
    {
        var sql = "SELECT userID, firstName, lastName, Email, Password FROM tUser WHERE userID = :userID";
        var rslt = queryExecute( sql, { userID = arguments.userID }, { datasource: dsn.name } );
        return rslt;
    }

    public any function saveUser()
    {
        if( IsNumeric( getuserID() ) && getuserID() > 0 )
        {
            var sql = "UPDATE tUser 
                          SET FirstName = :firstName, 
                              lastName = :lastName, 
                              email = :email, 
                              Password = :Password 
                        WHERE userID = :userID";
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
        }

        var rslt = queryExecute( sql, { userID = getuserID(),
                                        firstName = getfirstName(),
                                        lastName = getlastName(),
                                        email = getemail(),
                                        password = getpassword()
                                      }, 
                                      { datasource: dsn.name } );

        return rslt;
    }

}