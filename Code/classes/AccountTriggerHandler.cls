public class AccountTriggerHandler {
    public static boolean isExecuting = false;
    
    public static void OnBeforeInsert(List<Account> newAccounts){
        // EXECUTE BEFORE INSERT LOGIC
    }
    
    public static void OnAfterInsert(List<Account> newAccounts){
       
    }
    
    public static void OnBeforeUpdate(List<Account> oldAccounts, List<Account> updatedAccounts, Map<Id,Account> newAccountMap, Map<Id,Account> oldAccountMap){
        // BEFORE UPDATE LOGIC
    }
    
    public static void OnAfterUpdate(List<Account> oldAccounts, List<Account> updatedAccounts, Map<Id,Account> newAccountMap, Map<Id,Account> oldAccountMap){
        String message = System.Label.Gold_Customer_Message;
        for(Account acc: updatedAccounts){
            if(acc.Customer_classification__c == 'GOLD' && acc.Customer_classification__c != oldAccountMap.get(acc.Id).Customer_classification__c){
                SendSMSService.SendSMS(message.replace('<Account>', acc.Name));
            }
        }
    }
    
    public static void OnBeforeDelete(List<Account> AccountsToDelete, Map<Id,Account> MapAccountMap){
        // BEFORE DELETE LOGIC
    }
    
    public static void OnAfterDelete(List<Account> deletedAccounts, Map<Id,Account> MapAccountMap){
        // AFTER DELETE LOGIC
    }
    
    public static void OnUndelete(List<Account> restoredAccounts){
        // AFTER UNDELETE LOGIC
    }
}