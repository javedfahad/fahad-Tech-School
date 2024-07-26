public with sharing class OrderManager {
    

    // Create Order Record 
    public static List<CustomObject1__c> createOrders(List<OrderWrapper> OrderWrapper){
        List<CustomObject1__c> orderListInsert = new List<CustomObject1__c>();
        for (OrderWrapper orderIter : OrderWrapper) {
            CustomObject1__c orderObj = new CustomObject1__c();
            orderObj.Product_Name__c = orderIter.productName;
            orderObj.Quantity__c = orderIter.quantity;
            orderObj.price__c = orderIter.price;
            orderListInsert.add(orderObj);    
        }
        insert orderListInsert;
        return orderListInsert;
    }

    // Update Order Record
    public static void updateOrders(List<OrderWrapper> OrderWrapper){
        Map<String, OrderWrapper> mapOrder = new  Map<String, OrderWrapper>();
        for (OrderWrapper OrderIter : OrderWrapper) {
            mapOrder.put(OrderIter.productName, OrderIter);        
        }

          List<CustomObject1__c> ListOrder = [SELECT Product_Name__c FROM CustomObject1__c
                                      WHERE Product_Name__c IN :mapOrder.keySet()];

          for (CustomObject1__c ord : ListOrder) {
              ord.price__c = mapOrder.get(ord.Product_Name__c).price;
              ord.Quantity__c = mapOrder.get(ord.Product_Name__c).quantity;
            }
            update ListOrder;                              
    }

    public static void deleteOrder(List<Id> OrderIds) {

        List<CustomObject1__c> orderDelete = [SELECT Id FROM CustomObject1__c WHERE Id in :OrderIds];
        delete orderDelete;
        System.debug(orderDelete);
} 

}
