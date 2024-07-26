// ContactService is not Legalame so it will not savinng So i have to change the name to ConServ

public  class ConServ {
    public static List<WrapperClassSample> getAllContactsAndAccounts() {
        List<WrapperClassSample> returnVal = new List<WrapperClassSample>();
        List<Account> allAccounts = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
        for (Account acc : allAccounts) {
            WrapperClassSample obj = new WrapperClassSample();
            obj.acc = acc; 
            obj.con = acc.Contacts;
            returnVal.add(obj);
        }
        return returnVal;
    }
}