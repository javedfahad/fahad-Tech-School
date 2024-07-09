public class AccountManager {
    public static Map<String, List<Account>> getAccountsByIndustryAndRevenue() {
        Map<String, List<Account>> accountsByIndustry = new Map<String, List<Account>>();

        List<Account> accounts = [SELECT Id, Name, Industry, AnnualRevenue FROM Account];

        for (Account acc : accounts) {
            String revenueCategory = categorizeRevenue(acc.AnnualRevenue);
            String key = acc.Industry + '-' + revenueCategory;

            if (!accountsByIndustry.containsKey(key)) {
                accountsByIndustry.put(key, new List<Account>());
            }
            accountsByIndustry.get(key).add(acc);
        }
        return accountsByIndustry;
    }

    private static String categorizeRevenue(Decimal annualRevenue) {
        if (annualRevenue > 1000000) {
            return 'High';
        } else if (annualRevenue > 500000) {
            return 'Medium';
        } else {
            return 'Low';
        }
    }


    public static Map<String, List<Account>> getTopAccountsByIndustry() {
        Map<String, List<Account>> topAccountsByIndustry = new Map<String, List<Account>>();
        
        // Fetch all accounts ordered by industry and then by revenue
        List<Account> accounts = [
            SELECT Industry, Name, AnnualRevenue
            FROM Account
            WHERE Industry != null 
            ORDER BY Industry, AnnualRevenue DESC 
        ];

        // Iterate over the accounts and collect the top 3 for each industry
        Map<String, Integer> industryCountMap = new Map<String, Integer>();
        for (Account acc : accounts) {
            String industry = acc.Industry;
            if (!topAccountsByIndustry.containsKey(industry)) {
                topAccountsByIndustry.put(industry, new List<Account>());
                industryCountMap.put(industry, 0);
            }

            if (industryCountMap.get(industry) < 3) {
                topAccountsByIndustry.get(industry).add(acc);
                industryCountMap.put(industry, industryCountMap.get(industry) + 1);
            }
        }
        
        return topAccountsByIndustry;
    }
     
    // public static Map<String, List<Account>> getTopAccountsByIndustry() {
    //     Map<String, List<Account>> topAccountsByIndustry = new Map<String, List<Account>>();

    //     AggregateResult[] groupedResults = [
    //         SELECT Industry, Name, AnnualRevenue
    //         FROM Account
    //         ORDER BY Industry, AnnualRevenue DESC LIMIT 3
    //     ];

    //     for (AggregateResult ar : groupedResults) {
    //         String industry = (String) ar.get('Industry');
    //         Account acc = new Account(Name = (String) ar.get('Name'), AnnualRevenue = (Decimal) ar.get('AnnualRevenue'));

    //         if (!topAccountsByIndustry.containsKey(industry)) {
    //             topAccountsByIndustry.put(industry, new List<Account>());
    //         }
    //         topAccountsByIndustry.get(industry).add(acc);
    //     }
    //     return topAccountsByIndustry;
    // }

    public static List<Account> getAccountsByDynamicCriteria(String industry, Decimal minRevenue, Decimal maxRevenue) {
        String query = 'SELECT Id, Name, Industry, AnnualRevenue FROM Account WHERE Industry = :industry';

        if (minRevenue != null) {
            query += ' AND AnnualRevenue >= :minRevenue';
        }
        if (maxRevenue != null) {
            query += ' AND AnnualRevenue <= :maxRevenue';
        }

        List<Account> accounts = Database.query(query);
        return accounts;
    }
}