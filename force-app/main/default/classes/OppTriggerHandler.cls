public with sharing class OppTriggerHandler {
   
    Public static void UpdateDescBasedOnStage(List<Opportunity> oppList,Map<Id , Opportunity> oldMap){
        for(Opportunity opp : oppList){
            if(oldMap == null || opp.StageName != oldMap.get(opp.Id).StageName){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = 'Opportunity set to Closed Won';
                }
                else if(opp.StageName == 'Closed Lost'){
                    opp.Description = 'Opportunity set to Closed Lost';
                }
                else{
                    opp.Description = 'Opportunity Set to Open';      
                }
            }
        }
    }

    //When StageName is updated on Opportunity then Task is created automatically.

    public static void CreateTaskBasedOnStageName(List<Opportunity> oppList , Map<Id , Opportunity> oldMap){
        List<Task> tskList = new List<Task>();
            for (Opportunity opp : oppList) {
                if(opp.StageName != oldMap.get(opp.Id).StageName){
                Task tsk = new Task();
                tsk.WhatId = opp.Id;
                tsk.Subject = 'DemoFahad';
                tsk.Priority = 'Normal';
                tsk.Status = 'Not Started';
                tsk.OwnerId = opp.OwnerId; //or UserInfo.getUserId;
                tskList.add(tsk);
                }
            }

            if(!tskList.isEmpty()){
                insert tskList;
            }
    }

    

    // When Opp is created on any account then put the latest opp amoount on the Account
    // 'Latest opportintiy field'
    public static void populateOppAmount(List<Opportunity> oppList){
       List<Account> accList = new List<Account>();
       for(Opportunity opp : oppList){
        if(opp.AccountId != null){
            Account acc = new Account();
            acc.Id = opp.AccountId;
            acc.Total_opportunitity_Amount__c = opp.Amount;
            accList.add(acc);
        }
       }
    if(!accList.isEmpty()){
        update accList;
    }
    
}

    public static void createContractAndOpp(List<Opportunity> oppList){
        Map<Id , Opportunity> accountIdToOpp = new Map<Id,Opportunity>();
        for(Opportunity opp : oppList){
            if(opp.StageName == 'Closed Won'){
                accountIdToOpp.put(opp.AccountId, opp);
            }      
        }
        List<Contract> contlist = [SELECT Id,AccountId,Account.Name,EndDate,ContractTerm FROM Contract 
                                WHERE AccountId IN :accountIdToOpp.keySet() 
                                AND EndDate  <= NEXT_N_DAYS:30];
    
        List<Opportunity> opplistNew = new List<Opportunity>();
        List<Contract> conlistNew = new  List<Contract>();
       
        for(Contract cont : contlist){
            Opportunity opp = new Opportunity();
            opp = accountIdToOpp.get(cont.AccountId).clone(false, false, false, false);
            opp.Name = 'Renewal opp ' + cont.Account.Name;
            opplistNew.add(opp);
    
            Contract conNew = new  Contract();
            conNew = cont.clone(false, false, false, false);
            conNew.StartDate=cont.EndDate;
            conNew.ContractTerm=cont.ContractTerm;
            conlistNew.add(conNew);
        }
        insert opplistNew;
        insert conlistNew;
    
        //Call Email Method
                
          
            String userEmail = 'fahadjaved2601@gmail.com'; //Or add email 
            String subject = 'Notification for user Regarding Renewal contract ' ;
            String body = 'Your Contract is renewed successfully ';
    
            sendEmailToUser( userEmail, subject, body);
    }
    
    //send Email
    public static void sendEmailToUser(String userEmail, String subject, String body) {
    
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] { userEmail });
        email.setSubject(subject);
        email.setPlainTextBody(body);
    
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email }); 
    }
    
    
}