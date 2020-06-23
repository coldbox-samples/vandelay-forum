component extends="coldbox.system.Interceptor" output="true"
{
    configure()
    {
        
    }

    public any function postEvent( event, interceptData, buffer, rc, prc )
    {
        writeoutput( "postEvent was called" );
    }    

    public any function uploadPhoto( event, interceptData, buffer, rc, prc )
    {
        WriteOutput( "photo was uploaded!" );
    }
}