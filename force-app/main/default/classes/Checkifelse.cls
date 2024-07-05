public with sharing class Checkifelse {
    public Static void Checkifelse() {
        for (Integer i = 1; i<10; i++) {

            System.debug(i);
            
        }

    }

    public static void showList(){
        List<Account>accList = new List<Account>();
        Set<Id> accId = new set <Id>();

        accList = [select Id, Name FROM Account Limit 5];


        if (accList.size()>0) {
            for (Account acc : accList) {
                System.debug(acc.Id+'_'+acc.Name);
                
            }
            
        }
    }
}