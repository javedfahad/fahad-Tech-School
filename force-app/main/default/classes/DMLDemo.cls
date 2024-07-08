public with sharing class DMLDemo {
    public static void updateDemo(){
        List<Account> accList = new List<Account>();

        accList = [SELECT Id, Name, Rating FROM Account
                   WHERE Rating = 'Hot'];

        if (!accList.isEmpty()) {
             for (Account acc : accList) {
                  acc.Industry = 'Energy';
                
             }
              
        }  
        for (Integer i = 1; i<=5; i++) {
            Account acc = new Account();
            acc.Name = 'Test Upsert '+i;
            accList.add(acc);
            
        }         
        if (!accList.isEmpty()) {
            upsert accList;
            
        }
    }

    // public static void dmlDemo() {
    //     List<Account> accList = new List<Account>();

    //     // List<Contact> conList = new List<Contact>();
    //     for (Integer i= 1; i<=200;i++) {

    //     Account acc = new Account(); 
    //     acc.Name = 'Test DML Test '+ i;
    //     accList.add(acc);
    //     }
    //     insert accList;

    //     // Account acc1 = new Account();
    //     // acc1.Name = 'Test DML 119';
    //     // accList.add(acc1);

    //     // insert accList; 


    //     // Contact con = new Contact();
    //     // con.FirstName = acc.Name;
    //     // con.LastName  = acc.Name;
    //     // con.AccountId = accList[0].Id;
    //     // conList.add(con);


    //     // Contact con1 = new Contact();
    //     // con1.FirstName = acc1.Name;
    //     // con1.LastName  = acc1.Name;
    //     // con1.AccountId = accList[1].Id;
    //     // conList.add(con1);
      
    //     // insert conList;

    // }
}