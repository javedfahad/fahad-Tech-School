public with sharing class SOQLDemo {
    public static void SOQLDemo() {
        List<Account> accList = [SELECT Id, Name, Industry 
                                 FROM Account 
                                 WHERE Industry = 'Media'];


        for (Account acc : accList) {
             System.debug(acc);
            
        }
    }
}