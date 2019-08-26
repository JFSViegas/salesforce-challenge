({
    doInit: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'From Language',   fieldName: 'From_Language__c', 	type: 'text'},
            {label: 'Original Text',   fieldName: 'Original_Text__c',   type: 'text'},
            {label: 'To Language', 	   fieldName: 'To_Language__c', 	type: 'text'},
            {label: 'Translated Text', fieldName: 'Translated_Text__c', type: 'text'},
            {label: 'Status',   	   fieldName: 'Status__c',   		type: 'text'},
        ]);
        helper.getTranslationRequests(component, helper);
    }
})