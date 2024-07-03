public with sharing class AccountId {
    public Static ID AccountId(String Name, String Rating) {
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        

        insert acc;
        return acc.Id;

    }
}