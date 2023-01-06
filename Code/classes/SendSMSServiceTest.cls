@isTest()
public class SendSMSServiceTest {
	 Public static testmethod void testTwilio(){
        Account acc = new Account(name = 'ABC', Phone = '9866114470');
        insert acc;
        
        Opportunity opp = new Opportunity(Name = 'Sample Opp',AccountId = acc.Id,CloseDate = Date.today(), StageName= 'Open', Amount = 55000);
        insert opp;

        Test.setMock(HttpCalloutMock.class, new TwilioMockCallout());
        opp.StageName = 'Closed Won';
        update opp;
         
        Test.StartTest();
        SendSMSService.SendSMS('Sample message', acc.Id);
        SendSMSService.SendSMS('Sample message','9866114470');
        Test.StopTest();
     }
}