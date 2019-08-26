({
	onTranslateTextClicked : function(component, event, helper){
		helper.translate(component, event, helper);
    },
    
    enableButton : function(component, event, helper){
        let inputText = component.get("v.inputText");
        component.set('v.isButtonDisabled', inputText == null);    
    }
})