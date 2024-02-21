Public with sharing class MixedDmlErrorFixing {

   
    @future
    public static void createNewUser(String userName){
        try {
            User updateUser = [SELECT Id, Title FROM User WHERE Username = :userName LIMIT 1];
            updateUser.Title = 'DML Check';
            update updateUser;
        } catch (QueryException e) {
            System.debug('Query Error ==> ' + e.getMessage());
        } catch (DmlException e) {
            System.debug('DML Error ==> ' + e.getMessage());
        }
    }
    
    public static void createAccount(String accName){
        try {
            Account newAcc = new Account();
            newAcc.Name = accName;
            insert newAcc;
        } catch (DmlException e) {
            System.debug('DML Error ==> ' + e.getMessage());
        }
    }
}

