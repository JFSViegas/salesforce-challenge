({
	getTranslationRequests : function(component){
        var action = component.get("c.fetchTranslationRequestsList");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.data", response.getReturnValue());
                component.set("v.noRecords", response.getReturnValue() == null);
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