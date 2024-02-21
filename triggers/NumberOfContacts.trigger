/*
@description    : This Trigger is used to update the value of NumberofLocations__c field
@Author         : Vignesh Vellaisamy
@Created Date   : 19-02-2024

*/

trigger NumberOfContacts on Contact (after insert , after delete) {
    // if (trigger.isAfter) {
    //     if (trigger.isInsert) {
    //         GetNoOfContactsInAccount.updateContactInAccount(Trigger.new); 
    //     }
    //     if (trigger.isDelete) {
    //         GetNoOfContactsInAccount.updateContactInAccount(Trigger.old);
    //     }
    // }

        switch on Trigger.operationType {
            when AFTER_INSERT {
                GetNoOfContactsInAccount.updateContactInAccount(Trigger.new);
                
            }
            when AFTER_DELETE {
                GetNoOfContactsInAccount.updateContactInAccount(Trigger.old);
                
            }
        }
}