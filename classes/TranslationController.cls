public class TranslationController {
    public static String translateText(String input, String language){
        Translation__c translationObject = createRecord(input, language);
        ResponseDecoder translation = TranslationCalloutService.sendRequest();
        if(translation != null){
            translationObject.From_Language__c = translation.sourceLanguage;
            translationObject.Status__c = translation.status;
            translationObject.Translated_Text__c = translation.translatedText;
            update translationObject;
        }
        return translation.translatedText;
    }
    
    public static Translation__c createRecord(String originalText, String toLanguage){
        Translation__c t = new Translation__c();
        t.Original_Text__c = originalText;
        t.To_Language__c = toLanguage;
        t.From_Language__c = '';
        t.Translated_Text__c = '';
        insert t;
        return t;
    }
}