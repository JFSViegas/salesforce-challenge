@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        System.assertEquals('https://sandbox.unbabel.com/tapi/v2/translation/', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        HttpResponse res = new HttpResponse();
        String username = 'fullstack-challenge';
        String apiKey = '9db71b322d43a6ac0f681784ebdcc6409bb83359';
        req.setHeader('Authorization', 'ApiKey '+username + ':' + apiKey);
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"input_text":"hello"}');
        res.setStatusCode(200);
        return res;
    }
}