@isTest
public with sharing class OppTriggerHandlerTest {

    @TestSetup
     static void makeData(){
        Account testAccount = new Account();
        testAccount.Name ='Test Account';
        insert testAccount;
 
        Opportunity testOpp = new Opportunity();
            testOpp.Name = 'Test Opportunity';
            testOpp.StageName = 'Prospecting';
            testOpp.CloseDate = Date.today();
            testOpp.AccountId = testAccount.Id;
        insert testOpp;
 
        Contract testContract = new Contract();
            testContract.AccountId = testAccount.Id;
            testContract.StartDate = Date.newInstance(2024, 07, 25);
            testContract.ContractTerm = 1;
            testContract.Status ='Draft';
        insert testContract;
     }

     @isTest
      public static void createContractAndOppTest(){
        List<Opportunity> oppList = [SELECT Id, Name, AccountId, StageName, CloseDate FROM Opportunity ];
            List<Opportunity> oppList1 = new List<Opportunity>();
            for(Opportunity opp : oppList){
                opp.StageName = 'Closed Won';
                oppList1.add(opp);
            }
            update oppList1;

            //verify
            List<Opportunity> newOpp = [SELECT Id, Name, AccountId, StageName FROM Opportunity];
            Assert.areEqual(2, newOpp.size(), 'Renewal opp must be created.Check once again');
          
           List<Contract> newCont = [SELECT Id FROM Contract];
           Assert.areEqual(2, newCont.size(),'Renewal contract must be created.Check once again');
      }
}