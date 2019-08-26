public class TranslationRequestsController {
    public static List<Translation__c> getTranslationRequestsList(){
        List<Translation__c> translationRequests = [SELECT From_Language__c, Original_Text__c, To_Language__c, Translated_Text__c, Status__c FROM Translation__c LIMIT 10];
        return translationRequests;
    }
}