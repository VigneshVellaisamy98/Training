public with sharing class SingleEmailSending {
    
    public void sendingSingleEmailMessage(String emailOne,String emailTwo){

        Map<Integer,String> intToStr = new Map<Integer,String>();
        intToStr.put('1', 'a');
        intToStr.put('2', 'c');
        System.debug('intToStr -->' + intToStr);


        Messaging.reserveMassEmailCapacity(1);
        Messaging.SingleEmailMessage newEmail = new Messaging.SingleEmailMessage();

        String[] toAddress = new String[] {emailOne};
        String[] ccAddress = new String[] {emailTwo};

        newEmail.setToAddresses(toAddress);
        newEmail.setCcAddresses(ccAddress);
        newEmail.setReplyTo('vignesh.vellaisamy@4iapps.com');
        newEmail.setSenderDisplayName('Salesforce Admin');
        newEmail.setPlainTextBody('This is a demo email sent from apex code');
        newEmail.setHtmlBody('<p> This is a demo email sent from apex code </p> ');

        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {newEmail});
    }
}