<cfdocument pagetype="letter" format="pdf">

    <!---  Header --->
    <cfdocumentitem type="header">
    <cfoutput>
    <div>
    #dateformat(now(),"MMM DD, YYYY")# at #timeFormat(now(),"full")#
    </div>
    </cfoutput>
    </cfdocumentitem>

    <!---  Footer --->
    <cfdocumentitem type="footer">
    <cfoutput>
    <div>
    Page #cfdocument.currentpagenumber# of #cfdocument.totalpagecount#
    </div>
    </cfoutput>
    </cfdocumentitem>

    <!--- <cfoutput>#renderView()#</cfoutput> --->
    <cfoutput>#renderLayout( layout="main" )#</cfoutput>

</cfdocument>