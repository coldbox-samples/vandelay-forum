<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Welcome to ColdBox!</title>
        <meta name="description" content="ColdBox Application Template">
        <meta name="author" content="Ortus Solutions, Corp">
        <!---Base URL --->
        <base href="#event.getHTMLBaseURL()#" />
    </head>
    <body>
        <!---Top NavBar --->
        <nav role="navigation">
            <!---Brand --->
            <a href="#event.buildLink('')#"><strong>Home</strong></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
    
            <div id="navbarSupportedContent">
                <!---About --->
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a href="##" class="nav-link dropdown-toggle" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-info-circle"></i> About <b class="caret"></b>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right bg-dark" aria-labelledby="navbarDropdown">
                                <a href="" class="dropdown-item text-light bg-dark"><strong>#getSetting("codename",1)# (#getsetting("suffix",1)#)</strong></a>
                                <a href="http://coldbox.ortusbooks.com" class="dropdown-item text-light bg-dark"><i class="fas fa-book"></i> Help Manual</a>
                                <a href="mailto:bugs@coldbox.org?subject=DataBoss Bug Report" class="dropdown-item text-light bg-dark"><i class="fas fa-fire"></i> Report a Bug</a>
                                <a href="mailto:info@coldbox.org?subject=DataBoss Feedback" class="dropdown-item text-light bg-dark"><i class="fas fa-bullhorn"></i> Send Us Feedback</a>
                                <a href="http://www.ortussolutions.com/products/coldbox" class="dropdown-item text-light bg-dark"><i class="fas fa-home"></i> Professional Support</a>
                                <div class="dropdown-divider"></div>
                                <img class="rounded mx-auto d-block" width="150" src="includes/images/ColdBoxLogo2015_300.png" alt="logo"/>
                        </div>
                    </li>
                </ul>
            </div>
        </nav> <!---end navbar --->
    
        <!---Container And Views --->
        <div class="container">#renderView()#</div>
    
        <footer>
            <div>
                <p>
                    <a href="##"><i class="fas fa-arrow-up"></i> Back to top</a>
                </p>
                <p>
                    <a href="https://www.coldbox.org">ColdBox Platform</a> is a copyright-trademark software by
                    <a href="https://www.ortussolutions.com">Ortus Solutions, Corp</a>
                </p>
                <p>
                    Design thanks to
                    <a href="https://getbootstrap.com/">Twitter Bootstrap</a>
                </p>
            </div>
        </footer>
    </body>
    </html>
</cfoutput>

    