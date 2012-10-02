<cfcomponent extends="taffy.core.api">
	<cfscript>

		this.name = hash(getCurrentTemplatePath());

		variables.framework = {};
		variables.framework.defaultRepresentationClass = "taffy.bonus.AnythingToXmlRepresentation";

		function applicationStartEvent(){
			application.anythingToXml = createObject("component", "anythingtoxml.AnythingToXML").init();
		}

	</cfscript>
</cfcomponent>
