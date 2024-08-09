trigger LeadTriggerr on Lead (after Update) 
{
    if(trigger.isAfter)
    {
if(trigger.isUpdate)
{
    LeadTrigger.fetchLead(Trigger.new, trigger.oldMap);

}
    }
}