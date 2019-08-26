public class TranslationRequestsController {
    @AuraEnabled
    public static List<UnbabelChalleng__Translation__c> fetchTranslationRequestsList(){
        List<UnbabelChalleng__Translation__c> translationRequests = [SELECT UnbabelChalleng__From_Language__c, UnbabelChalleng__To_Language__c, UnbabelChalleng__Original_Text__c, UnbabelChalleng__Translated_Text__c, UnbabelChalleng__Status__c FROM UnbabelChalleng__Translation__c ORDER BY CreatedDate ASC LIMIT 10];
        return translationRequests;
    }
}