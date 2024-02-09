public class SendSingleEmailMessage {
    Public void sendSingleEmailMethod(){
  
  Messaging.reserveSingleEmailCapacity(2);
  Messaging.SingleEmailMessage mymail = new Messaging.SingleEmailMessage();
  String[] toaddresses = new String[] {'user1@example.com'}; 
  String[] ccaddresses = new String[] {'user2@example.com'};
  //String[] bccaddresses = new String[] {'user3@example.com’};
  
  mymail.setToAddresses(toAddresses);
  mymail.setCcAddresses(ccAddresses);
  //mymail.setBccAddresses(bccAddresses);
  mymail.setReplyTo('support@example.com');
  mymail.setSenderDisplayName('Salesforce Support');
  mymail.setSubject('An email from Salesforce');
  mymail.setPlainTextBody('This email has been sent through Apex');
  //mymail.setHtmlBody(‘<p> This email has been sent through Apex</p>`);
  
  Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mymail });
    }
  }