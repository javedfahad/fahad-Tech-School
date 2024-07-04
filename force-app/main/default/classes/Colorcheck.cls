public with sharing class Colorcheck {
    public static void Colorcheckch() {

        List<String> Colors = new List<String>();

       Colors.add('REdd');
       Colors.add('Green');
 
        System.debug('Colours Are=  '+ Colors);
        Colors.add(1,'Black');
         System.debug('Colours Are=  '+ Colors);

         
        List<String> Colors2 = new List<String>();

        Colors2.add('White');
        Colors2.add('Violet');
        Colors.addAll(Colors2);
        System.debug('Colours Are=  '+ Colors);
    }
}