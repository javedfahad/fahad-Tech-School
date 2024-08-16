@isTest
public with sharing class AccountTriggerHandlerTest {
    @TestSetup
    public static void DataAccSetup(){
       List<Account> accList = new List<Account>();        
        for(Integer i =0 ;i<3 ;i++){
            Account acc = new Account();
            acc.Name = 'Demo'+i;  
            acc.Primary_Contact_number__c = '629821822' + i;
            acc.Primary_Email__c = 'demo' + i + '@gmail.com';
            acc.Add_Description__c = 'Desc' + i;
            acc.StartDate__c = Date.Today();
            acc.EndDate__c = Date.Today().addDays(3);
            accList.add(acc);
        }
        Insert accList;
      
  List<Contact> conList = new List<Contact>();        
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;            
            conList.add(con);
        }
        insert conList;
    }
  
    @isTest
    static void UpdateRelatedContactsTest() {
        List<Account> accList = [SELECT Id,Name ,Primary_Contact_number__c,Primary_Email__c, Add_Description__c,
                                 StartDate__c,EndDate__c FROM Account WHERE Name LIKE 'Demo%'];
        
                                 AccountTriggerHandler.updateRelatedContacts(accList);
        for (Account acc : accList) {
            Contact con = [SELECT Id, Primary_Phone_Number__c, Primary_Email__c, Add_Description__c, 
                           StartDate__c, EndDate__c FROM Contact WHERE AccountId = :acc.Id LIMIT 1];      
            //Verify
            Assert.areEqual(acc.Primary_Contact_number__c, con.Primary_Phone_Number__c);
            Assert.areEqual(acc.Primary_Email__c , con.Primary_Email__c);
            Assert.areEqual(acc.Add_Description__c,con.Add_Description__c);
            Assert.areEqual(acc.StartDate__c , con.StartDate__c);
            Assert.areEqual(acc.EndDate__c , con.EndDate__c);
        }
    }
}