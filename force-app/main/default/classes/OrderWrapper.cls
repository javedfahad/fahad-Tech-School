//Wrapper class
public class OrderWrapper {
    public String productName { get; set; }
    public Decimal quantity { get; set; }
    public Decimal price { get; set; }
   //constructor
    public orderWrapper(CustomObject1__c od){
        this.productName = od.Product_Name__c;
        this.quantity = od.Quantity__c;
        this.price  = od.Price__c;

    }
}


