public with sharing class ApexScenariosdemo {
    public static void apexScenario1() {
        List<Account> accList = new  List<Account>();

        accList = [SELECT Id, Name, (SELECT Id FROM Contacts)
                   FROM Account WHERE Phone != null];


                   if (!accList.isEmpty()) {
                     for (Account acc : accList) {
                        System.debug(acc.Name +' has '+ acc.Contacts.size() +' Contatcs Related');
                        
                     }
                    
                   }
    }
    public static void apexScenario2() {
        List<Account> accList = new  List<Account>();

        accList = [SELECT Id, Name, (SELECT Id, Amount FROM Opportunities)
                   FROM Account WHERE Phone != null];


                   if (!accList.isEmpty()) {
                     for (Account acc : accList) {
                            Decimal total = 0;
                            for (Opportunity Opp : acc.Opportunities) {
                                total = total + opp.amount;    
                            }   
                            System.debug(acc.Name +' has '+ total  +' Worth Opportunities');
                       
                     }
                    
                   }
    }

    public static void apexScenario3() {
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [SELECT Id, StageName FROM Opportunity
                   WHERE CreatedDate = THIS_YEAR];

        if (!oppList.isEmpty()) {
            for (Opportunity opp : oppList) { 
                 if (opp.StageName == 'Closed Won') {
                    opp.Description = 'Opportunity is Closed Won';
                 }else if (opp.StageName == 'Closed Lost') {
                       opp.Description = 'Opportunity is Closed Lost';
                    
                 } else {
                 
                    opp.Description = 'Opportunity is Open';
                }    
            }
            update oppList;
            // Total Contact Count , Total_Contact_Count
        }
    }
    public static void apexScenario4() {
       List<Account> accList = new  List<Account>();
       
       accList = [SELECT Id,Total_Contact_Count__c, (SELECT Id FROM Contacts)
                  FROM Account WHERE CreatedDate = THIS_YEAR];

        if (!accList.isEmpty()) {
             for (Account acc  : accList) {
                acc.Total_Contact_Count__c = acc.Contacts.size();
                 
             }
            update accList; 
        }

        
    }
    public static void apexScenario5() {
      List<Contact> conList = new List<Contact>();
      
      conList = [SELECT Id, MobilePhone, Account.Phone FROM Contact 
                 WHERE CreatedDate = THIS_YEAR]; //LAST_WEEK

        if (!conList.isEmpty()) {
             for (Contact Con : conList) {
                   if (Con.MobilePhone == null && Con.Account.Phone != null) {
                       Con.MobilePhone = Con.Account.Phone;
                    
                   }
                
             }
             Update conList;
            
        }         
    } 

    public static void apexScenario6() {
        List<Application__c> appList = new  List<Application__c>(); 

        appList = [SELECT Id, Name, Guardian_City__c FROM Application__c LIMIT 15];
        for (Application__c app : appList) {
            System.debug(app.name+ '  the City  ' + app.Guardian_City__c);
        }
    }

}