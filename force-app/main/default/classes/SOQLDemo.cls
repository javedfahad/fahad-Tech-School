public with sharing class SOQLDemo {
    // public static void SOQLDemo() {
    //     List<Account> accList = [SELECT Id, Name, Industry 
    //                              FROM Account 
    //                              WHERE Industry = 'Media'];


    //     for (Account acc : accList) {
    //          System.debug(acc);
            
    //     }
    // }
    // public static void SOQLquery(){
    //     Integer AR = 10000;
    //     Set<Id> accIds = new Set<Id>();
    //     List<Account> accList = [SELECT Id, Name, Industry, AnnualRevenue 
    //                               FROM Account LIMIT 10];

    //         for (Account acc : accList) {
    //             System.debug(acc);
    //             accIds.add(acc.Id); 
                
    //         }  
            
    //     List<Account> accList1 = [SELECT Id, Name, Industry, AnnualRevenue 
    //                               FROM Account 
    //                                WHERE Id IN: accIds];

    //     // Integer count = [SELECT COUNT(Id), Name, Industry,Rating 
    //     //                  FROM Account WHERE Industry = 'Media']; 
                         
                          
    //     // System.debug([SELECT COUNT(Industry) FROM Account]);
    //     System.debug([SELECT MIN(AnnualRevenue) FROM Account]);
    //     System.debug([SELECT MAX(AnnualRevenue) FROM Account]);
    //     System.debug([SELECT AVG(AnnualRevenue) FROM Account]);
    //     System.debug([SELECT SUM(AnnualRevenue) FROM Account]);
    //     System.debug([SELECT COUNT() FROM Account]);
    //     System.debug([SELECT COUNT(Name) FROM Account]);

    // }


    //  public static void aggDemo(){
    //     AggregateResult[] groupedResults = [SELECT Account.Name, SUM(Amount)
    //                                         FROM Opportunity
    //                                         GROUP BY Account.Name];

    //     System.debug(groupedResults);
    //     for (AggregateResult ar : groupedResults) {
    //         System.debug('Account ID = ' + ar.get('Name'));
    //         System.debug('Sum of Amount = ' + ar.get('expr0'));
            
    //     }                                    
    //  }  

    public static void parentTochildDemo(){
        List<Account>accList=new List<Account>();
        accList = [SELECT Id, Name, (SELECT Id, FirstName, LastName From Contacts)
                   From Account WHERE Rating = 'Hot'];

            
            for (Account acc : accList) {
                System.debug('Account Name : '+ acc.Name);
                for (Contact con : acc.Contacts) {
                    System.debug(con.FirstName+ ' ' +con.LastName); 
                    
                }
                
            }       
    }
} 