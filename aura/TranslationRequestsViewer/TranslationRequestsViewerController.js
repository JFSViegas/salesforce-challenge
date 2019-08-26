({
    doInit: function (component, event, helper) {
        component.set('v.columns', [
            {label: 'From Language',   fieldName: 'UnbabelChalleng__From_Language__c', 	 type: 'text'},
            {label: 'Original Text',   fieldName: 'UnbabelChalleng__Original_Text__c',   type: 'text'},
            {label: 'To Language', 	   fieldName: 'UnbabelChalleng__To_Language__c', 	 type: 'text'},
            {label: 'Translated Text', fieldName: 'UnbabelChalleng__Translated_Text__c', type: 'text'},
            {label: 'Status',   	   fieldName: 'UnbabelChalleng__Status__c',   		 type: 'text'}
        ]);
        helper.getTranslationRequests(component, helper);
    }
})