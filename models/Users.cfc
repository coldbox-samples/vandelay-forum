component
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

    public any function saveUser( userID, firstName, lastName, Email, Password )
    {
        if( IsNumeric( arguments.userID ) && arguments.userID > 0 )
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

        var rslt = queryExecute( sql, { userID = arguments.userID,
                                        firstName = arguments.firstName,
                                        lastName = arguments.lastName,
                                        email = arguments.email,
                                        password = arguments.password
                                      }, 
                                      { datasource: dsn.name } );

        return rslt;
    }

}