component singleton accessors='true'
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";

    property name="MessageID";
    property name="UserID";
    property name="MessageBody";
    property name="Subject";
    property name="dateTimeCreated";

    property name="objUsers" inject="Users";

    public any function init()
    {
        return this;
    }

    public any function search( MessageBody, Subject )
    {
        /*
            Search functionality will go here 
        */
    }

    public any function create( UserID, MessageBody, Subject, dateTimeCreated )
    {
        var sql = "INSERT INTO tMessages ( UserID, MessageBody, Subject, dateTimeCreated )
                   VALUES
                   (
                    :UserID,
                    :MessageBody,
                    :Subject,
                    :dateTimeCreated
                   )";

        var params = {
                UserID = { value=arguments.UserID, cfsqltype="cf_sql_int" },
                MessageBody = { value=arguments.MessageBody, cfsqltype="cf_sql_varchar" },
                Subject = { value=arguments.Subject, cfsqltype="cf_sql_varchar" },
                dateTimeCreated = { value=arguments.dateTimeCreated, cfsqltype="cf_sql_timestamp" },
        };

        var rslt = queryExecute( sql, params, { datasource: dsn.name } );
        return rslt;
    }

    public any function read( numeric MessageID )
    {
        var sql = "";
        var params = {};

        if( arguments.keyExists( "MessageID" ) )
        {
            sql = "SELECT MessageID, userID, MessageBody, Subject, 
                              dateTimeCreated 
                       FROM tMessages
                       WHERE MessageID = :MessageID";
            params = { 
                            MessageID = { value=arguments.MessageID, 
                                          cfsqltype="cf_sql_int" } 
                         };

        }
        else 
        {
            sql = "SELECT MessageID, userID, MessageBody, Subject, dateTimeCreated FROM tMessages";
        }

        var rslt = queryExecute( sql, params, { datasource: dsn.name } );
        return rslt;
    }

    public any function update( MessageID, UserID, MessageBody, Subject, dateTimeCreated )
    {
        var sql = "UPDATE tMessages 
                      SET UserID = :UserID, 
                          MessageBody = :MessageBody, 
                          Subject = :Subject, 
                          dateTimeCreated = :dateTimeCreated 
                    WHERE MessageID = :MessageID";

        var params = {
                MessageID = { value=arguments.MessageID, cfsqltype="cf_sql_int" },
                UserID = { value=arguments.UserID, cfsqltype="cf_sql_int" },
                MessageBody = { value=arguments.MessageBody, cfsqltype="cf_sql_varchar" },
                Subject = { value=arguments.Subject, cfsqltype="cf_sql_varchar" },
                dateTimeCreated = { value=arguments.dateTimeCreated, cfsqltype="cf_sql_timestamp" },
        };

        var rslt = queryExecute( sql, params, { datasource: dsn.name } );
        return rslt;
    }

    public any function delete( MessageID )
    {
        var sql = "DELETE FROM tMessages WHERE MessageID = :MessageID";
        var params = {
            MessageID = { value=arguments.MessageID, cfsqltype="cf_sql_int" }
        };

        var rslt = queryExecute( sql, params, { datasource: dsn.name } );
        return rslt;
    }

}