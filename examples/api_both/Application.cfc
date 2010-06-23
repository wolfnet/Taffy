component extends="taffy.core.api" {

	this.name = hash(getCurrentTemplatePath());
	this.mappings = {};
	this.mappings["/taffy"] = expandPath('.');

	//do your onApplicationStart stuff here
	function applicationStartEvent(){
		application.beanFactory = createObject("component", "coldspring.beans.DefaultXMLBeanFactory");
		application.beanFactory.loadBeans('/taffy/examples/api_both/config/coldspring.xml');
	}

	//do your onRequestStart stuff here
	function requestStartEvent(){}

	//this function is called after the request has been parsed and all request details are known
	function onTaffyRequest(string verb, string cfc, struct requestArguments, string mimeExt){
		//this would be a good place for you to check API key validity and other non-resource-specific validation
		return true;
	}

	//called when taffy is initializing or when a reload is requested
	void function configureTaffy(){

		setBeanFactory(application.beanfactory);
		setDebugKey("debug");
		setReloadKey("reload");
		setReloadPassword("true");

		//you could change this to a custom class to change the default instead of specifying an override for each response
		setDefaultRepresentationClass("taffy.core.genericRepresentation");

		//these are both the default settings, but the functions are used here to illustrate how and where you should use them
		registerMimeType("json", "application/json");
		setDefaultMime("json");
	}

}
