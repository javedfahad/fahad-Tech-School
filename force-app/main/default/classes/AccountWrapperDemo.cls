public with sharing class AccountWrapperDemo {

@AuraEnabled(cacheable = true)
public static List<AccountWrapper> getAccountWithContact() {
    List<AccountWrapper> wrapList = new List<AccountWrapper>();
    List<Account> accList = [SELECT Id, Name,
                                    (SELECT Id, FirstName, LastName FROM Contacts)
                                     FROM Account LIMIT 10];

    if(!accList.isEmpty()){
        for(Account account : accList){
            wrapList.add(new AccountWrapper(account, account.Contacts));
        }
    }
    return wrapList;                                 
}

//Wrapper class

public class AccountWrapper{
    @AuraEnabled public Account accRecord { get; set; }
    @AuraEnabled public List<Contact> contactList { get; set; }

    //Constructor
    public AccountWrapper(Account accRecord, List<Contact> contactList){
        this.accRecord = accRecord;
        this.contactList = contactList;
    }
}
}