component
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";

    public any function init()
    {
        return this;
    }

    public array function getUsers()
    {
        var sql = "SELECT * FROM tUser";
        var rslt = queryExecute( sql, {}, { datasource: dsn.name, returntype="array"  } );
        return rslt;
    }
}