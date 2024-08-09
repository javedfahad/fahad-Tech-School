public with sharing class OpportunityTriggerHandler {

    public static void  validateAmount(List<Opportunity> oppList){

        for (Opportunity opp : oppList) {
            if (opp.Amount == null) {
                opp.addError('Please Populate an Opportunity');
            }
        }
    }
   
    public static void updateDesc(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){

        List<Opportunity> opplistTobeUpdated = new List<Opportunity>();

        for (Opportunity opp : oppList) 
        {
        Opportunity o = new Opportunity();
        o.id=opp.id;
        if (opp.StageName != oldMap.get(opp.Id).StageName) {
             if (opp.StageName == 'Closed Won') {
                
                o.Description = 'Opportunity is closed won';
             }
             else if (opp.StageName == 'Closed Lost') {
               
                o.Description =  'opportunity is closed Lost';
             }
        } 
               opplistTobeUpdated.add(o);
        }
        if (!opplistTobeUpdated.isEmpty()) {
            update opplistTobeUpdated;
            
        }
    }

}