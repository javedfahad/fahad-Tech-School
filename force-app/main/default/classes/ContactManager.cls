public with sharing class ContactManager {

//Retrieve All Contacts for a Specific Account
public static List<Contact> getContactsByAccountId(Id accountId) {
   return [SELECT FirstName , LastName , Phone 
   FROM Contact
   WHERE AccountId=:accountId];
}
//Aggregate Contacts by Title
public static Map<String, Integer> getContactCountByTitle(){       
   List<AggregateResult> aggList = [SELECT Title, COUNT(Id) totalCount  
                                   FROM Contact 
                                   GROUP BY Title];
   Map<String, Integer> conTitleCount= new Map<String, Integer>();
   for (AggregateResult aggIterate : aggList){
       conTitleCount.put((String)aggIterate.get('Title'), (Integer)aggIterate .get('totalCount'));
   }
   return conTitleCount;        
}


//Dynamic SOQL for Contact Search
public static List<Contact> getContactsByDynamicCriteria(String emailDomain, String title){
   String searchQuery ='SELECT Id, Name, Email, Title FROM Contact WHERE Email LIKE \'%' + emailDomain + '%\' AND Title = :title';
   List<Contact> listName = Database.query(searchQuery);
   return listName;
}
}
