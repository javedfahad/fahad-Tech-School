public with sharing class contactDataset {
    @AuraEnabled
    public static void saveContact(String recordTypeName, String name, String email, String phoneNumber, String address) {
        // Get the Contact record type ID based on the recordTypeName
        String recordTypeId = [SELECT Id FROM RecordType WHERE SObjectType = 'Contact' AND Name = :recordTypeName LIMIT 1].Id;

        // Create a new Contact record
        Contact newContact = new Contact(
            LastName = name,
            Email = email,
            Phone = phoneNumber,
            MailingStreet = address,
            RecordTypeId = recordTypeId
        );

        // Insert the Contact record
        insert newContact;
    }
}
