/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AccountTriggerHandlerTest {

    @isTest
    static void createOppTest() {
        // TO DO: implement unit test

        List<Account> accList = new List<Account>();

        for (Integer i = 0; i < 10; i++) {

            Account acc = new Account();
            
            acc.Name = 'testmen' + i;
            acc.Active__c = 'Yes';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();

        List<Opportunity> Opplist = [SELECT Id 
                                     FROM Opportunity 
                                     WHERE AccountId =: accList[0].Id];

        System.assert(Opplist != null , 'Opportunity is not Created');
    }

    @isTest
    static void populateRatingInsert(){

        List<Account> accList = new List<Account>();

        for (Integer i = 0; i < 10; i++) {

            Account acc = new Account();
            
            acc.Name = 'testmen' + i;
            acc.Active__c = 'Yes';
            acc.Industry = 'Media';
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        test.stopTest();

        List<Account> updateAccList = [SELECT Rating
                                        FROM Account
                                        WHERE Id =: accList[0].Id];

        System.assertEquals('Hot', updateAccList[0].Rating);
    }

    // @isTest
    // static void populateRatingUpdate(){
        
    // }
}