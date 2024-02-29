/*
@description    : This class is used for the LWC Component
@Author         : Vignesh Vellaisamy
@Created Date   : 19-02-2024

*/

public with sharing class GetNoOfContactsInAccount {
    @InvocableMethod(Label = 'newLabel')
    public static void updateContactInAccount(List<Contact> contacts){
        
        Set<Id> accountId = new Set<Id>();

        for (Contact Con : contacts) {
            accountId.add(Con.AccountId);
        }
        List<Account> getContact = [SELECT Id, NumberofLocations__c,(SELECT Id FROM Contacts) FROM Account WHERE Id IN : accountId];

        for (Account acc : getContact) {
            acc.NumberofLocations__c = acc.Contacts.size();
        }
        Update getContact;
    }

    public static void updateCases(List<Case> TotalCases){
        Set<Id> caseId = new Set<Id>();

        for (Case caseNumber : TotalCases) {
            caseId.add(caseNumber.AccountId);
        }

        List<Account> getCases = [SELECT Id, Number_Of_Cases__c,(Select Id FROM Cases) FROM Account WHERE Id IN : caseId];
        for (Account acc1 : getCases) {
            acc1.Number_Of_Cases__c = acc1.Cases.size();
        }
        update getCases;
    }

    @AuraEnabled(Cacheable = true)
    public static Integer getNumberOfCases(Id accountId) {
        return [SELECT count() FROM Case WHERE AccountId = :accountId];
    }
}