public with sharing class SendEmailToContact {
    public static void SendEmail()
  {
     EmailTemplate et = [SELECT Id,Subject, Body FROM EmailTemplate WHERE Name ='SalesNewCustomerEmail'];
        List<Contact> contacts=[Select Id,Email From Contact Where LastName='Eze'];
        List<Id> conIds=new List<Id>();
        List<Id> whatIds=new List<Id>();
        for(Contact c: contacts) {
            conIds.add(c.Id);
            whatIds.add(et.Id);
        }
		system.debug(conIds);
        Messaging.MassEmailMessage email = new Messaging.MassEmailMessage(); 
        email.setTargetObjectIds(conIds);
        email.setTemplateId(et.id);
        Messaging.SendEmail(New Messaging.MassEmailMessage[] {email});

  }
  
    public static void emailerAttachment(){
         // Email sending with attachment
         Document doc = [SELECT Id,Name FROM Document WHERE Name = 'AW Computing logo'];
         list<ID> docid=new list<ID>();
         docid.add(doc.id);
         Messaging.SingleEmailMessage semail = new Messaging.SingleEmailMessage();
         semail.setEntityAttachments(docid);
         semail.setUseSignature(false);
         semail.setSubject('Sending document as attachemnt');
         String[] sendTo = new String[]{'somtobeeze@gmail.com'};
         semail.setToAddresses(sendTo);
         semail.setPlainTextBody('Please inspect the document attached');
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{semail});
 
     }
 
}
