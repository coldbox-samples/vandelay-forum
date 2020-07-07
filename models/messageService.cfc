component singleton accessors='true'
{
    property name="dsn" inject="coldbox:setting:vandelay_dsn";
    property name="populator" inject="wirebox:populator";

    public messageService function init()
    {
        return this;
    }

    public any function search( MessageBody, Subject )
    {
        /*
            Search functionality will go here 
        */
    }

    public any function create( objMessage )
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

        var rslt = queryExecute( sql, params, { datasource: dsn.name, result="msgInfo" } );

        objMessage.setMessageID( msgInfo.generatedKey );

        return objMessage;
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

            var rslt = queryExecute( sql, params, { datasource: dsn.name } );
            var objMessage = new models.Messages();

            objMessage = populator.populateFromQuery( target=objMessage, qry=rslt );
            return objMessage;
        }
        else 
        {
            sql = "SELECT MessageID, userID, MessageBody, Subject, dateTimeCreated FROM tMessages";
            var rslt = queryExecute( sql, params, { datasource: dsn.name } );
            return rslt;
        }
    }

    public any function update( objMessage )
    {
        var sql = "UPDATE tMessages 
                      SET UserID = :UserID, 
                          MessageBody = :MessageBody, 
                          Subject = :Subject, 
                          dateTimeCreated = :dateTimeCreated 
                    WHERE MessageID = :MessageID";

        var params = {
                MessageID = { value=arguments.objMessage.getMessageID(), cfsqltype="cf_sql_int" },
                UserID = { value=arguments.objMessage.getUserID(), cfsqltype="cf_sql_int" },
                MessageBody = { value=arguments.objMessage.getMessageBody(), cfsqltype="cf_sql_varchar" },
                Subject = { value=arguments.objMessage.getSubject(), cfsqltype="cf_sql_varchar" },
                dateTimeCreated = { value=arguments.objMessage.getdateTimeCreated(), cfsqltype="cf_sql_timestamp" },
        };

        var rslt = queryExecute( sql, params, { datasource: dsn.name } );
        return objMessage;
    }

    public void function delete( objMessage )
    {
        var sql = "DELETE FROM tMessages WHERE MessageID = :MessageID";
        var params = {
            MessageID = { value=arguments.objMessage.getMessageID(), cfsqltype="cf_sql_int" }
        };
    }

}