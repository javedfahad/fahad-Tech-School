public with sharing class LeadTrigger {
   
    //This Function will fetch the data from lead and create Account, Contact and Opprtunity;
    public static void fetchLead(List<Lead> llist, Map<ID, Lead> oldLeadList){
        List<Database.LeadConvert> leadList = new List<Database.LeadConvert>();
        for(Lead  llcc : llist) {
            if(llcc.Status == 'Closed - Converted' &&  llcc.Status != oldLeadList.get(llcc.Id).Status){
            Database.LeadConvert  newLead = new Database.LeadConvert();
            newLead.setLeadId(llcc.Id);
            newLead.setConvertedStatus(llcc.Status);
            Database.convertLead(newLead);
            }
            
        }  
    }
}