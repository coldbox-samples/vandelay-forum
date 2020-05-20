component
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";

    public any function init()
    {
        return this;
    }

    public array function getUsers()
    {
        var aryUsers = [ "John", "Paul", "George", "Ringo" ];
        return aryUsers;
    }

    public query function getUsersDB()
    {
        var sql = "SELECT * FROM tUser";

        // WriteDump( variables );
        // abort;

        var rslt = queryExecute( sql, {}, { datasource: dsn.name } );

        WriteDump( rslt );
        abort;
    }
}