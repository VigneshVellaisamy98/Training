public with sharing class AccountUpdation {

    Public static void updateAccountRating(List<Account> accList){
        for(Account acc : accList){
            if (acc.Industry != null || acc.Industry == 'Media') {
                acc.Rating = 'Hot';
            }            
        }
    }
}
