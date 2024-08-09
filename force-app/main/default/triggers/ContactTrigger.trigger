trigger ContactTrigger on Contact (After insert, after delete, after undelete) {
     
    if(Trigger.isInsert){
        if (Trigger.isAfter) {
            ContactTriggerHandler.totalContactcount(Trigger.new);
        }
    }

    if(Trigger.isDelete){
        if (Trigger.isAfter) {
            ContactTriggerHandler.totalContactcount(Trigger.old);
        }
    }

    if(Trigger.isUndelete){
        if (Trigger.isAfter) {
            ContactTriggerHandler.totalContactcount(Trigger.new);
        }
    }
}