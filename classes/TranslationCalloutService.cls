public class TranslationCalloutService {
	public static ResponseDecoder sendRequest(){
    	HttpRequest req = new HttpRequest();
        req.setEndpoint('https://sandbox.unbabel.com/tapi/v2/translation/');
        req.setMethod('POST');
        String username = 'username';
        String apiKey = 'apiKey';
        Blob headerValue = Blob.valueOf(username + ':' + apiKey);
        String authorizationHeader = 'ApiKey ' + EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader);
        req.setHeader('Content-Type', 'Tickets');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
            ResponseDecoder translation = new ResponseDecoder();
            translation.decode(res.getBody());
            return translation;
        }
        else 
            return null;
   }
}