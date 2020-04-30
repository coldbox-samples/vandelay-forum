component{

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		/**
		 * --------------------------------------------------------------------------
		 * App Routes
		 * --------------------------------------------------------------------------
		 *
		 * Here is where you can register the routes for your web application!
		 * Go get Funky!
		 *
		 */

		// A nice healthcheck route example
		route("/promo2020",function(event,rc,prc){
			return "Coming soon in 2020!";
		});



		route("/promo2020",function(event,rc,prc){
			return "Coming soon!";
		});


		// A nice RESTFul Route example
		route( "/api/echo", function( event, rc, prc ){

			var rslt = {
				"error" : false,
				"data" 	: "Welcome to my awesome API!"
			}
			var formattedRslt = serialize( rslt );
			return formattedRslt;
		});

		route( "/people" ).toResponse( "users.list" );

		// Conventions based routing
		route( ":handler/:action?" ).end();
	}

}