public with sharing class Setcheck {
    public Static void Setcheck() {
    // //     Set<Integer> inset = new Set<Integer>();

    // //    inset.add(10);
    // //    inset.add(20);
    // //    inset.add(50);
    //    inset.add(60);
       
       Set<Integer> inset2 = new Set<Integer>();
       inset2.add(30);
       inset2.add(40);
       inset2.add(50);

       System.debug('remove the '+inset2.remove(30));
       System.debug('insert2 '+inset2);

    //    System.debug('merge set to list ' +inset.addAll(inset2));

    //     System.debug('Set value is '+inset);


    //     Set<String> inset1 = new Set<String>();

    //    inset1.add('Vikash');
    //    inset1.add('Animesh');
    //    inset1.add('Fahad');

    //    System.debug('merge1 set to list ' +inset.equals(inset2));

    //    System.debug('Set name is '+inset1);
       
    }
}