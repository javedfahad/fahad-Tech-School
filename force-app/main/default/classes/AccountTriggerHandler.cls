public with sharing class AccountTriggerHandler {

    public static void updateAccount(List<Account> accList, Map<Id, Account> accOldMap){

            List<Account> accTobeupdated = new List<Account>();

            for (Account  acc : accList) {

                Account a = new Account();
                a.id=acc.Id;
                a.Description = 'Test Recursion';

                accTobeupdated.add(a);
                
            }

            if (!accTobeupdated.isEmpty()) {

                update accTobeupdated;
                
            }
    }

    public static void preventDelete(List<Account> accList){

        Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        for (Account acc : accList) {

            if (UserInfo.getProfileId () != p.Id || acc.Active__c == 'Yes' || acc.LastModifiedDate.date() == System.today()) {

                acc.addError('Acttive acoount cant be deleted');
            }
            
        }
    }

    public static void updateRelatedContact(List<Account> accList, Map<Id, Account> accOldMap) {
        List<Contact> conList = new List<Contact>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        Set<Id> accIds = new Set<Id>();
    
        // Iterate through the list of accounts
        for (Account accl : accList) {
            // Check if the phone number was updated
            if (accl.Phone != accOldMap.get(accl.Id).Phone) {
                accMap.put(accl.Id, accl);
                accIds.add(accl.Id);
            }
        }
    
        // Query contacts related to the accounts whose phone numbers were updated
        List<Account> accountsWithContacts = [
            SELECT Id, Phone, (SELECT Id, HomePhone FROM Contacts)
            FROM Account
            WHERE Id IN :accIds
        ];
    
        // Update the contacts' home phone number
        for (Account accl : accountsWithContacts) {
            if (accl.Contacts != null) {
                for (Contact con : accl.Contacts) {
                    con.HomePhone = accl.Phone;
                    conList.add(con);
                }
            }
        }
    
        // Update the contacts if there are any changes
        if (!conList.isEmpty()) {
            update conList;
        }
    }
    

    public static void populateRating(List<Account> accList, Map<Id, Account> accOldMap) {
        for (Account acc : accList) {
            if ((acc.Industry != null && acc.Industry == 'Media') || (acc.Industry != accOldMap.get(acc.Id).Industry && acc.Industry == 'Media')) {
                acc.Rating = 'Hot';
            }
        }
    }
    

    public static void phoneUpdate(List<Account>accList, map<Id, Account> accoldMap){
        
        for (Account  acc : accList) {
             if (acc.Phone != accoldMap.get(acc.Id).Phone) {
                acc.Description = 'Phone is Updated  | old Value = '+ accoldMap.get(acc.Id).Phone + '  new Value = '+ acc.Phone;
             }
        }
    }

    public static void createOpp(List<Account>accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for (Account acc : accList) {
            // if (acc.Active__c = 'Yes') {
                
            // }
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }

        Database.SaveResult[] srList = Database.insert(oppList,false);
        for(Integer i =0; i<srList.lenght; i++){
            if (!srList[i].isSuccess()) {
                String errors = '';
                for (Database.Error err : srList[i].getErrors()) {
                    errors = errors+err.getMessage();
                }
                accList[i].addError(errors);
            }
        }
    }

    public static void UpdateDesc(List<Account>accList){
           for (Account acc : accList) {
                 acc.Description = 'Account is Created';
             }

    }

    
}