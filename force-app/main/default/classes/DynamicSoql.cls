public with sharing class DynamicSoql {
    public static void dynamiSoqlcheck() {
           String industry = 'Technology';
           String dynamicQuery = 'SELECT Id, Name FROM Account WHERE Industry =:industry LIMIT 10';
 
           List<Account> accList = Database.query(dynamicQuery);
           System.debug(accList);
    }

    public static void variableUseMethod(String name) {
        List<Account> accObj = [SELECT Id, Name, CreatedDate, Type FROM Account WHERE Name != :name];
        System.debug('---Account data---' + accObj);
    }

    public static void dynamiCaquery(String typeCondition) {
        if (typeCondition != null && typeCondition != '') {
            String query = 'SELECT Id, Name, Type FROM Account WHERE Type = \'' + typeCondition + '\'';
            
            List<Account> accountList = Database.query(query);
            System.debug('---dynamic data ---' + accountList);
        } else {
            System.debug('---dynamic data --- Type condition is null or empty');
        }
    }
}
