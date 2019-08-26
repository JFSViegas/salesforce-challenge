({
	translateText : function(component, event, helper){
		helper.translate(component, event, helper);
    },
    
    enableButton : function(component, event, helper){
        let inputText = component.find("inputText").get("v.value");
        if(inputText != null){
            component.set('v.isButtonDisabled', 'false');
        }       
    }
})