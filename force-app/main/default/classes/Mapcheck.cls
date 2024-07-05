public with sharing class Mapcheck {
    public static void sobjectDemo(){
        List<Account> accList = new List <Account>();
        Map<Id, Account> accMap = new Map<Id, Account>();

        accList = [SELECT Id, Name  FROM Account LIMIT 5];

        accMap.putAll(accList);
        System.debug('Map Contains = '+ accMap);
    }
    public static void Mapcheck() {
        Map<Integer, String> colors = new Map<Integer, String>();
        colors.put(1, 'Green');
        colors.put(2, 'Blue' );
        colors.put(3, 'Red'  );  
        colors.put(4, 'Blue' );

        System.debug('Color contains ... '+colors);

        Map<Integer, String> morecolors = new Map<Integer, String>();
        morecolors.put(5, 'Purple');
        morecolors.put(6, 'violet');
        morecolors.put(7, 'Orange');
        morecolors.put(8, 'Black');

        System.debug('Color contains ... '+ morecolors);

        colors.putAll(morecolors);
        System.debug('Color contains ... '+colors);
 

    }
}