public with sharing class getProducts {

    @AuraEnabled(Cacheable = true)
    public static List<Product2> getProductQuery() {
        
        // try {
        //     List<Product2> products = [SELECT Id,Name,ProductCode FROM Product2 LIMIT 5];
            
        // } catch (QueryException e) {
        //     System.debug('Query Exception: ' + e.getMessage());
        
        // }
        List<Product2> products = [SELECT Id,Name,ProductCode FROM Product2 LIMIT 5];
        return products;
    }
}
