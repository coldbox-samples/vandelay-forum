component
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";

    public any function init()
    {
        return this;
    }

    public query function getUsers()
    {
        var sql = "SELECT userID, firstName, lastName FROM tUser";
        var rslt = queryExecute( sql, {}, { datasource: dsn.name } );
        return rslt;
    }

    public query function getUserDetails( userID )
    {
        var sql = "SELECT userID, firstName, lastName FROM tUser WHERE userID = :userID";
        var rslt = queryExecute( sql, { userID = arguments.userID }, { datasource: dsn.name } );
        return rslt;
    }
}