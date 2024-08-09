@isTest
public with sharing class TemperatureConverterTest1 {
    
    @isTest
    Public static void testWarmTemp(){
        Decimal celsius = TemperatureConverter1.ferenheitTocelsius1(70);
        System.assertEquals(21.11, celsius);
    }

    @isTest
    public static void testFreezingpoint(){
        Decimal celsius = TemperatureConverter1.ferenheitTocelsius1(32);
        System.assertEquals(0, celsius);
    }

    @isTest 
    public static void testBolingpoint(){
        Decimal celsius = TemperatureConverter1.ferenheitTocelsius1(212);
        System.assertEquals(100, celsius, 'Bolingpoint point Temperature is expected '); 
    }

    @isTest
    public static void testNegativetemo(){
        Decimal celsius = TemperatureConverter1.ferenheitTocelsius1(-10);
        System.assertEquals(-23.33, celsius); 
    }
}