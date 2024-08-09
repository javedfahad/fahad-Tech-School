public with sharing class ContactTriggerHandler {

    public static void totalContactcount(List<Contact> conList) {
        // Create a set to collect account IDs from the contacts
        Set<Id> accId = new Set<Id>();

        // Populate the set with account IDs from the contact list
        for (Contact con : conList) {
            if (con.AccountId != null) {
                accId.add(con.AccountId);
            }
        }

        // Retrieve accounts with their related contacts
        List<Account> accList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accId];

        // Create a list to store accounts with updated contact count
        List<Account> accountsToUpdate = new List<Account>();

        // Iterate over the retrieved accounts and update the contact count
        for (Account acc : accList) {
            acc.Total_Contact_Count__c = acc.Contacts.size();
            accountsToUpdate.add(acc);
        }

        // Update the accounts if there are any to update
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}
