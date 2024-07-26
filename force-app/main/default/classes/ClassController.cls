public class ClassController {
   
    @AuraEnabled
    public static Wrapper method (){
        // Query accounts
        List<Account> getAccount = [SELECT Id, Name FROM Account];
        // Query contacts
        List<Contact> getContact = [SELECT Id, Name FROM Contact];

        // Instance of wrapper
        Wrapper wrp = new Wrapper();
        wrp.accList = getAccount;
        wrp.conList = getContact;

        return wrp;
    }

    // Main Wrapper Class Setup
    public class Wrapper {
        @AuraEnabled
        public List<Account> accList;
        
        @AuraEnabled
        public List<Contact> conList;
    }
}
