/**
 * A ColdBox Event Handler
 */
component{

	property name="objAdmins" inject="Administrators@MyAdminTools";

	/**
	 * Home page
	 */
	function index( event, rc, prc ){

		prc.aryAdmins = objAdmins.getAdminUsers();

		event.setView( "home/index" );
	}

}
