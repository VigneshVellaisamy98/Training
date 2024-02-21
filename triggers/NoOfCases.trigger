trigger NoOfCases on Case (after insert,after delete) {
    switch on Trigger.operationType {
        when AFTER_INSERT {
            GetNoOfContactsInAccount.updateCases(Trigger.new);
        }
        when AFTER_DELETE {
            GetNoOfContactsInAccount.updateCases(Trigger.old);
        }
    }
}