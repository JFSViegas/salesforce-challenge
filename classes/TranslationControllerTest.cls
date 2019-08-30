@IsTest
private class TranslationControllerTest {
    @IsTest static void translateTextTest(){
        Boolean result = false;
        Test.startTest();
        try{
        	String uid = TranslationController.translateText('ola', 'en');
        }
        catch(Exception exc) {
            result = true;
        }
        Test.stopTest();
		System.assertEquals(result, true);
    }
    
   @IsTest static void checkRequestStatusTest(){
       Boolean result = false;
       Test.startTest();
       try{
       		String status = TranslationController.checkRequestStatus('');
       }
        catch(Exception exc) {
            result = true;
        }
       Test.stopTest();
	   System.assertEquals(result, true);
    }
}