trigger AccountTrigger on Account (before insert, after Insert, before update, after update, before delete) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            //AccountTriggerHandler.UpdateDesc(Trigger.new);
            //AccountTriggerHandler.populateRating(Trigger.new, null);
            // for (Account acc : Trigger.new) {
            //     acc.Description = 'Account is Created';
            // }
        }
        else if (Trigger.isAfter) {
           // AccountTriggerHandler.createOpp(trigger.new);
        }
    }

    if (Trigger.isUpdate) {
        if (Trigger.isBefore){
            // AccountTriggerHandler.phoneUpdate(trigger.new, trigger.oldMap);
            // AccountTriggerHandler.populateRating(Trigger.new, trigger.oldMap);
        }
        else if (Trigger.isAfter) {
                 AccountTriggerHandler.updateRelatedContacts(trigger.new );
                //  if (!PreventRecursion.firstcall) {
                //     PreventRecursion.firstcall = true;
                //     AccountTriggerHandler.updateAccount(trigger.new , trigger.oldMap);
                //  }
                 
        }
    }

    if (Trigger.isDelete) {
        if (Trigger.isBefore) {
           // AccountTriggerHandler.preventDelete(Trigger.old);
                }
                
    }
    
}