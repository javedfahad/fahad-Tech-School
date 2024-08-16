public with sharing class AccountTriggerHandler {
    
     // Field on Account object ---> Field1,Field2,.......
//When account is updated then its related contact is also updated
public static void updateRelatedContacts(List<Account> accList){
    List<Contact> conList = new List<Contact>();
    Map<Id , Account> accToAccountMap = new Map<Id , Account>();       
    for(Account acc : accList){
        if(acc.Primary_Contact_number__c != null  ||
           acc.Primary_Email__c != null ||
           acc.Add_Description__c != null ||
           acc.StartDate__c != null ||
           acc.EndDate__c !=  null  
          ){
            accToAccountMap.put(acc.Id , acc);
        }
    }
    if(accToAccountMap.size() > 0){
         for(Contact con : [SELECT Id,Primary_Phone_Number__c,Primary_Email__c ,Add_Description__c,
                               StartDate__c,EndDate__c, AccountId
                               FROM Contact WHERE AccountId IN : accToAccountMap.keySet()]){
                                   
                                   if(accToAccountMap.containsKey(con.AccountId)){
                                       Account acc = accToAccountMap.get(con.AccountId);
                                       con.Primary_Phone_Number__c = acc.Primary_Contact_number__c;
                                       con.Primary_Email__c = acc.Primary_Email__c;
                                       con.Add_Description__c = acc.Add_Description__c;
                                       con.StartDate__c = acc.StartDate__c;
                                       con.EndDate__c = acc.EndDate__c;
                                       conList.add(con);
                                   }
                               }
    }
    if(conList.size()>0){
        update conList;
    }       
    
}
}