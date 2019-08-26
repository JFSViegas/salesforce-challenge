public class TranslationCalloutService {
	public static ResponseDecoder sendRequest(String inputText, String uid, String method){
    	HttpRequest req = new HttpRequest();
        String endpoint = method == 'POST' ? 'https://sandbox.unbabel.com/tapi/v2/translation/' : 'https://sandbox.unbabel.com/tapi/v2/translation/uid/';
        if(uid != ''){
            endpoint.replace('uid', uid);
        }
        else{
        	req.setBody(inputText);
        }
        req.setEndpoint(endpoint);
        req.setMethod(method);
        String username = 'fullstack-challenge';
        String apiKey = '9db71b322d43a6ac0f681784ebdcc6409bb83359';
        req.setHeader('Authorization', 'ApiKey '+username + ':' + apiKey);
        req.setHeader('Content-Type', 'application/json');
        Http http = new Http();
        HTTPResponse res = http.send(req);
        system.debug('res get code: ' + res.getStatusCode());
        system.debug('res get body: ' + res.getBody());
        if(res.getStatusCode() >= 200 && res.getStatusCode() < 300){
            ResponseDecoder translation = new ResponseDecoder();
            translation = translation.decode(res.getBody());
            return translation;
        }
        else 
            return null;
   }
}