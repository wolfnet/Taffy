<cfcomponent extends="taffy.core.baseRepresentation" output="false" hint="WNT Representation class">


	<cffunction name="getAsJson" access="public" output="false" taffy:mime="application/json">
		<cfreturn serializeJson(variables.data) />
	</cffunction>
	
	
	<cffunction name="getAsJsonP" access="public" output="false" taffy:mime="application/javascript">
		<cfset var _ = structNew() />
		
		<cfif !structKeyExists(url,"callback")>
			<cfreturn "alert('callback is required for jsonp mimetype')" />
		<cfelse>
			<cfreturn "#url.callback#(#SerializeJSON(variables.data)#);" />
		</cfif>
		
	</cffunction>
	

</cfcomponent>