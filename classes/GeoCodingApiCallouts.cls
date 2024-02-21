public with sharing class GeoCodingApiCallouts {
        Public static String getWeather(String city){
           
            Http http = new http();
            HttpRequest req = new HttpRequest();
            req.setEndpoint('callout:GeoCoding/current.json?q='+city);
            req.setMethod('GET');
            HttpResponse res = http.send(req);
            return res.getBody();
           
        }
    
    }
    
