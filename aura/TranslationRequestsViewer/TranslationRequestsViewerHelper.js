({
	getTranslationRequests : function(component){
        var action = component.get("c.getTranslationRequestsList");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.data", response.getReturnValue());
                if(response.getReturnValue() == null){
                    component.set("v.noRecords", "true");
                }
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
                component.set("v.noRecords", "true");
            }
        });
        $A.enqueueAction(action);
    }
})