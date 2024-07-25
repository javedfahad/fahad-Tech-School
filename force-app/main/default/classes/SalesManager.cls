public with sharing class SalesManager {

    public static Map<String, Decimal> getTotalSalesPerAccount() {
        AggregateResult[] AggList = [SELECT ACCOUNT.Name, SUM(AMOUNT) sAmount
                                     FROM Opportunity 
                                     WHERE StageName = 'Closed Won'
                                     GROUP BY Account.Name];

           Map<String, Decimal> Aggresult = new Map<String, Decimal>();
           for (AggregateResult agg : AggList) {
             Aggresult.put((String)agg.get('Name'),(Decimal)agg.get('sAmount'));
           } 
           return Aggresult;          
    }

    public static Map<String,Decimal> getTopSalesReps(){
        AggregateResult[] aggSales = [Select Sum(Amount) salesRep, Owner.Id 
                                      FROM Opportunity
                                      WHERE StageName = 'Closed Won' 
                                      Group By Owner.Id Order By Sum(Amount)  
                                      DESC LIMIT 5];
        
        Map<String,Decimal> Topname = new Map<String,Decimal>();       
        for (AggregateResult aggname : aggSales) {
            Topname.put((String)aggname.get('Name'),(Decimal)aggname.get('salesRep'));
            
        }   
        
        return Topname;
    }

    public static List<Opportunity> searchSalesRecords(Date startDate, Date endDate, Id accountId, Id salesRepId){
      List<String> queryCheck = new List<String>();
      
      String check ='SELECT Id,Name, CloseDate, Account.Id, Owner.Id FROM Opportunity WHERE';
      if (startDate != null) {
        queryCheck.add('CloseDate >= :startDate');
      }
      if (endDate != null) {
        queryCheck.add('CloseDate <= :endDate');
      } 
      if (accountId != null) {
        queryCheck.add('AccountId = :accountId');
      }
      if (salesRepId != null) {
        queryCheck.add('OwnerId = :salesRepId');  
      }
      check += String.join(queryCheck, ' AND ');
      return Database.query(check);
    }

}