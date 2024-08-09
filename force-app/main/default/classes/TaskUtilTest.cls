@isTest
public with sharing class TaskUtilTest {
    
    @isTest
    public static void testTaskpriority(){
        String pri = TaskUtil.getTsakPriority('NY');
        System.assertEquals('Normal', pri);
    }

    @isTest
    public static void testTaskhighpriority(){
        String pri = TaskUtil.getTsakPriority('CA');
        System.assertEquals('High', pri);
    }

    @isTest
    public static void testTaskinvalidpriority(){
        String pri = TaskUtil.getTsakPriority('Montana');
        System.assertEquals(null, pri);
    }
}