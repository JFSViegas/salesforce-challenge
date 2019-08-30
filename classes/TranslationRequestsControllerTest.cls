@IsTest
private class TranslationRequestsControllerTest {
    @IsTest static void fetchTranslationRequestsListTest(){
        Integer initialSize = fetchRecordsList();
        Test.startTest();
        TranslationController.createRecord('', '', '', '', '');
        List<UnbabelChalleng__Translation__c> recordsList = TranslationRequestsController.fetchTranslationRequestsList();
        Integer finalSize = fetchRecordsList();
        Test.stopTest();
        System.assertNotEquals(initialSize, finalSize);
    }
    
    private static Integer fetchRecordsList(){
        List<UnbabelChalleng__Translation__c> recordsList = TranslationRequestsController.fetchTranslationRequestsList();
        return recordsList.size();
    }
}