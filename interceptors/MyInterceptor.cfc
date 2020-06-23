component extends="coldbox.system.Interceptor" output="true"
{
    configure()
    {
        
    }

    public any function postEvent( event, interceptData, buffer )
    {
        writeoutput( "postEvent was called" );
    }    
}