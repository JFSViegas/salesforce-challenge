({
    translate : function(component, event, helper) {
        var action = component.get("c.translateText");
        action.setParams({
            input : component.get("v.inputText"),
            language : component.find("languageSelected").get("v.value"),
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                this.makeText("Translation request submitted!");
                window.setTimeout($A.getCallback(() =>
                	this.getTranslationStatus(component, event, helper, response.getReturnValue())
                ), 1000);
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
                this.makeText("An error has ocurred. Please try again.");
            }
        });
        $A.enqueueAction(action);
    },
    
    getTranslationStatus : function(component, event, helper, uid) {
        var action = component.get("c.checkRequestStatus");
        action.setParams({
            uid : uid
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                let ret = response.getReturnValue();
                if(ret != null) {
                    component.set("v.translation", ret);
                } else {
                window.setTimeout($A.getCallback(() =>
                    this.getTranslationStatus(component, event, helper, uid)
                ), 1000);
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
            }
        });
        $A.enqueueAction(action);
    },
    
    makeText : function(messageToDisplay) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            type: "success",
            message: messageToDisplay
        });
        toastEvent.fire();
    }
})