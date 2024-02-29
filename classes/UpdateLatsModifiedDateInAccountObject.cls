public with sharing class UpdateLatsModifiedDateInAccountObject {

    Public Static void updateLastModifiedDate(){

        List<Account> accountList = [SELECT Id,Name,CreatedDate
                                     FROM Account];
        for (Account acc : accountList ) {
            Datetime daTi = acc.CreatedDate;

            String weekName =daTi.format('EEE');

            if(weekName == 'Sat'){
                acc.LastModifiedDate = acc.LastModifiedDate+2;
            }
            else if(weekName == 'Sun'){
                acc.LastModifiedDate = acc.CreatedDate+1;
            }
           
        }
        update accountList;
    }
}
