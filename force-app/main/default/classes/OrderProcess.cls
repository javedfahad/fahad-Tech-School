public with sharing class OrderProcess {

    //this is process oder class
    public static void processOrder() {
        List<OrderWrapper> newOrderList = new List<OrderWrapper>();
        CustomObject1__c od = new CustomObject1__c();
        od.Product_Name__c = 'Electronics';
        od.Quantity__c = 10;
        od.price__c = 52;

        od.Product_Name__c = 'Headphones';
        od.Quantity__c = 25;
        od.price__c = 250;

        OrderWrapper order = new OrderWrapper(od);
        newOrderList.add(order);
        OrderManager.createOrders(newOrderList);
    }
}