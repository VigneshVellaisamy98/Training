trigger LeadTrigger on Lead (after update) {
    if (Trigger.isAfter && Trigger.isUpdate) {
        LeadHandler.handleLeadConversion(Trigger.newMap, Trigger.oldMap);
    }
}
