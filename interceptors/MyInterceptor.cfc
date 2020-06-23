component extends="coldbox.system.Interceptor" output="true"
{
    configure()
    {
        
    }

    public any function postEvent( event, interceptData, buffer, rc, prc )
    {
        // writeoutput( "postEvent was called" );
        arguments.buffer.clear();
        arguments.buffer.append( "<p><b>postEvent was called</b></p>" );
    }    

    public any function uploadPhoto( event, interceptData, buffer, rc, prc )
    {
        // WriteOutput( "photo was uploaded!" );
        arguments.buffer.clear();
        arguments.buffer.append( "photo was uploaded!" );
    }
}