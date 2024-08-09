public with sharing class TemperatureConverter1 {

    // This Function convert Ferenheit to Celsius
    public static Decimal ferenheitTocelsius1(Decimal fh) {

        Decimal fc = (fh-32) * 5/9;
        return fc;
    }
}