({
	translate : function(component, event, helper) {
        var action = component.get("c.translateText");
        action.setParams({
			input : component.find("inputText").get("v.value"),
			language : component.find("languageSelected").get("v.value")
		});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.translation", response.getReturnValue());
                Toast.makeText("Translation request submitted!");
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
                Toast.makeText("An error has ocurred. Please try again.");
            }
        });
        $A.enqueueAction(action);
    }
})