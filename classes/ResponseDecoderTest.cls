@IsTest
public class ResponseDecoderTest {
    @IsTest
    public static void decodeTest(){
        Test.startTest();
        ResponseDecoder.decode('{balance: 99937, client: username, price: 6, source_language: en, status: completed, target_language: pt, text: Hello, world!, text_format: text, translated_text: Olá Mundo!, uid: ac1a53a264}');
		Test.stopTest();
    }
}