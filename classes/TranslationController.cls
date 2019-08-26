public class TranslationController {
    @AuraEnabled
    public static String translateText(String input, String language){
        try {
            TranslationWrapper w = new TranslationWrapper();
            w.text = input;
            w.target_language = language;
            ResponseDecoder translation = TranslationCalloutService.sendRequest(JSON.serialize(w), '', 'POST');
            if(translation != null){
                createRecord(input, language, translation.source_language, translation.status, translation.uid);
            }
            return translation.uid;
        }catch(Exception exc) {
            throw new AuraHandledException(exc.getMessage()+' - '+exc.getStackTraceString());
        }
    }
    
    @AuraEnabled
    public static String checkRequestStatus(String uid){
        UnbabelChalleng__Translation__c recordToCheck = [SELECT UnbabelChalleng__Status__c, UnbabelChalleng__Translated_Text__c FROM UnbabelChalleng__Translation__c WHERE UnbabelChalleng__uid__c = :uid];
        TranslationWrapper w = new TranslationWrapper();
        w.uid = uid;
        ResponseDecoder translationRequested = TranslationCalloutService.sendRequest(JSON.serialize(w), uid, 'GET');
        if(recordToCheck.UnbabelChalleng__Status__c != translationRequested.translatedText){
            if(translationRequested.status == 'completed'){
                recordToCheck.UnbabelChalleng__Translated_Text__c = translationRequested.translatedText;
            }
            recordToCheck.UnbabelChalleng__Status__c = translationRequested.status;
            update recordToCheck;
        	return translationRequested.translatedText;
        }
        return null;
    }
    
    public static void createRecord(String originalText, String toLanguage, String sourceLanguage, String status, String uid){
        UnbabelChalleng__Translation__c t = new UnbabelChalleng__Translation__c();
        t.UnbabelChalleng__Original_Text__c = originalText;
        t.UnbabelChalleng__To_Language__c = toLanguage;
        t.UnbabelChalleng__From_Language__c = sourceLanguage;
        t.UnbabelChalleng__Status__c = status;
        t.UnbabelChalleng__uid__c = uid;
        insert t;
    }
    
    public class TranslationWrapper {
        public String text;
        public String target_language;
        public String text_format = 'text';
        public String uid;
    }
}