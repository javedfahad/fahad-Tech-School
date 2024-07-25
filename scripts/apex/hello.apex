//SOQLDemo.SOQLDemo();
//Map<String, Decimal> p =SalesManager.getTotalSalesPerAccount();
//System.debug(p);

//Map<String, Decimal> p = SalesManager.getTopSalesReps();
//System.debug(p);

Map<String, Decimal> p = SalesManager.searchSalesRecords('22/06/2024', '23/07/2024', '006dL000002pR0DQAU', '005dL000002drhqQAA');
System.debug(p);