public class TwilioMockCallout implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"sucess":"Message sent successfully"}');
        res.setStatusCode(201);
        return res;
    }
}