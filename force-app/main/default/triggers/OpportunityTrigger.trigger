trigger OpportunityTrigger on Opportunity (before insert,after Insert , before update, after update) {

    if (Trigger.isInsert) {
        if(Trigger.isBefore){
           // OpportunityTriggerHandler.validateAmount(Trigger.new);
        }
        if(Trigger.isAfter){
           // OppTriggerHandler.createContractAndOpp(Trigger.new);
        }
    }

    if(Trigger.isUpdate) {
        if(Trigger.isAfter){
            //     if (!PreventRecursion.firstcall) {
            //         PreventRecursion.firstcall = true;
            //         OpportunityTriggerHandler.updateDesc(Trigger.new, Trigger.oldMap);
                    
            // }
            OppTriggerHandler.createContractAndOpp(Trigger.new);
        }
    }
}