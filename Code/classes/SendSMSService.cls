public with sharing class SendSMSService {
    
    @future(callout = true)
    public static void SendSMS(String message) {
        if(System.Label.CEO_Mobile != NULL){
            SendSMS(message, System.Label.CEO_Mobile);
        }
    }
    
    public static String SendSMS(String message, string phone) {
        errorResponseWrapper erw;
        String response;
        Twilio_API__c twilioAPI = Twilio_API__c.getOrgDefaults();
        String twilioAccountId = twilioAPI.AccountId__c;
        String token = twilioAPI.Token__c;
        String fromPhNumber = twilioAPI.Phone__c;
        String version = twilioAPI.Version__c;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(twilioAPI.Endpoint__c + twilioAccountId + '/SMS/Messages.json');
        req.setMethod('POST');
        req.setHeader('X-Twilio-Client', 'salesforce-' + version);
        req.setHeader('User-Agent', 'twilio-salesforce/' + version);
        req.setHeader('Accept', 'application/json');
        req.setHeader('Accept-Charset', 'utf-8');
        req.setHeader('Authorization','Basic '+ EncodingUtil.base64Encode(Blob.valueOf(twilioAccountId + ':' + token)));
        req.setBody('To='+EncodingUtil.urlEncode(phone,'UTF-8')+'&From='+EncodingUtil.urlEncode(fromPhNumber,'UTF-8') + '&Body=' + message);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug(res.getBody());
        if(res.getStatusCode()==201) 
            response = 'SMS Sent Successfully';
        else{ 
            erw =(errorResponseWrapper)json.deserialize(res.getBody(),errorResponseWrapper.class);
            response = erw.message;    
        }
        return response;
    }
    
    @AuraEnabled(cacheable = true)
    public static String SendSMS(String message, Id accId) {
        errorResponseWrapper erw;
        String response;
        String twilioAccountId = 'AC395c097c0f2ad59a43f1c05b74de6840';
        String token = 'a10688dccfa39cb368434a78acdcaff7';
        String fromPhNumber = '+12672625830';
        String VERSION = '3.2.0';
        Account acc = [SELECT Id, Phone FROM Account WHERE Id =:accId];
        if(acc.Phone != NULL){
            response = SendSMS(message, acc.Phone);
        }
        return response;
    }
    
    public class errorResponseWrapper{
       String code;
       String message;
       String moreInfo;
       String status;    
   }
}