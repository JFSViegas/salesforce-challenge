@IsTest
private class TranslationCalloutServiceTest {
    @IsTest static void sendRequestTest(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        TestWrapper w = new TestWrapper();
        w.text = 'Olá';
        w.target_language = 'English';
        ResponseDecoder result = TranslationCalloutService.sendRequest(JSON.serialize(w), '', 'POST');
        Test.stopTest();
        System.assertEquals(null, result.translatedText);
        System.assertEquals(null, result.status);
    }
    
    public class TestWrapper {
        public String text;
        public String target_language;
        public String text_format = 'text';
    }
}