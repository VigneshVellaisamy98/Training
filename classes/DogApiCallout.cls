/*
@description    : This class is used for the LWC Component
@Author         : Vignesh Vellaisamy
@Created Date   : 14-02-2024

*/

public with sharing class DogApiCallout {
  
        @AuraEnabled
        public static String getDogPicture(){
            try {
                Http http = new Http();
                HttpRequest req = new HttpRequest();
                req.setEndpoint('callout:Dog_API_NC');  // we can call the named cred API name through this endPoint
                req.setMethod('GET');
                HttpResponse res = http.send(req);
                
                return res.getBody();
                
            } catch (Exception e) {
                throw new AuraHandledException(e.getMessage());
            }
        }
}