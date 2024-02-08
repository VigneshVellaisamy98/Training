public with sharing class getGeoLoactionAPICallouts {
    Private Static final String geoCodingUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=';
    public getGeoLoactionAPICallouts() {
        Public Double Latitude;
        Public Double Longitude;
    }
    
    public static void geoLocation(String address){
        geoCodingResponse result = new geCodingResponse();

        try {
           String encodedAddress = EncodingUtil.urlEncode(address, 'UTF-8');
           String endpointURL =  geoCodingUrl+address;

           HttpRequest request = new HttpRequest();
           request.setEndpoint(endpointURL);
           request.setMethod('GET');

           HttpResponse response = new Http().send(request);

           if (response.getStatusCode() == 200) {
                List<Object> Coordinates = (List<Object>) JSON.deserializeUntyped(response.getBody());

                if (Coordinates != null && Coordinates.isEmpty()) {
                    result.Latitude = Coordinates[0].get('lat');
                    result.Longitude = Coordinates[0].get('lon');
                }

           else {
                    // Handle case when no coordinates are found
                    System.debug('No coordinates found for the address');
                }
            } else {
                // Handle the error response
                System.debug('The request failed with status code: ' + response.getStatusCode());
            }
        } catch (Exception e) {
            System.debug('Exception: ' + e.getMessage());
        }

        return result;
    
      
       

    }
}