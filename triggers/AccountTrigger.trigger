trigger AccountTrigger on Account (before insert) {
    if(trigger.isBefore){
        if (trigger.isInsert) {
            AccountUpdation.updateAccountRating(trigger.new);
        }
       
    }
    
}