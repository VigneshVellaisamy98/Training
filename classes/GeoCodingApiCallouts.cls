public with sharing class GeoCodingApiCallouts {
    
    // public static void getGeoLocation(String cityName) {
    //     String apiKey = '6111994e443d8202ada5764204d61b4e';
    
    //     Http http = new Http();
    //     HttpRequest httpReq = new HttpRequest();
        
    //     String endpoint = 'http://api.openweathermap.org/geo/1.0/direct';
    //     String queryParameters = 'q=' + EncodingUtil.urlEncode(cityName, 'UTF-8');
        
    //     String endpointWithQuery = endpoint + '?' + queryParameters;
        
    //     httpReq.setEndpoint(endpointWithQuery);
    //     httpReq.setMethod('GET');
    //     httpReq.setHeader('q', queryParameters);
    //     httpReq.setHeader('appid', apiKey);
    
    //     HttpResponse response = http.send(httpReq);
    
    //     system.debug(response.getBody());
    //     system.debug(response.getStatus());
    // }
    
    

        // Method to get geographic location based on city name, state code, and country code
        public static void getGeoLocation(String cityName, String stateCode, String countryCode) {
            String apiKey = 'e713baea24fc4c69af8527a3bb98f900';
            
            // Construct the endpoint URL with parameters
            String endpoint = 'http://api.openweathermap.org/geo/1.0/direct';
            String queryParameters = 'q=' + EncodingUtil.urlEncode(cityName, 'UTF-8') + ',' + 
                                     stateCode + ',' + countryCode  + 
                                     '&appid=' + apiKey;
            
            String endpointWithQuery = endpoint + '?' + queryParameters;
            
            // Create HTTP request
            Http http = new Http();
            HttpRequest httpReq = new HttpRequest();
            httpReq.setEndpoint(endpointWithQuery);
            httpReq.setMethod('GET');
            
            // Send HTTP request
            HttpResponse response = http.send(httpReq);
    
            // Handle response
            if (response.getStatusCode() == 200) { // Success
                // Process response body or perform other operations
                System.debug(response.getBody());
            } else {
                // Handle error response
                System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
            }
        }
    }
    
