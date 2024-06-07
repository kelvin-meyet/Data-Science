FINAL REPORT
INTRODUCTION:
Market Basket Analysis (MBA) is a powerful technique used by retailers to understand customer purchasing behavior and optimize various aspects of retail operations. This report presents the findings and recommendations resulting from a Market Basket Analysis conducted on a dataset containing 7501 transaction records from a retail store. The analysis aimed to uncover meaningful associations and patterns among items purchased together to provide actionable insights for retail optimization.

DATA DESCRIPTION AND SOURCE:
The dataset comprised transactional records, where each record represented a single purchase made at the retail store. Each transaction contained a list of items sold during that specific transaction. The dataset was structured in a transactional format, facilitating the application of association rule mining techniques for Market Basket Analysis. Data can be assessed here.

AIMS AND OBJECTIVES:
The primary aim of the project was to conduct Market Basket Analysis to uncover hidden associations and patterns among items purchased together.
Objectives: 
i.	Discover frequently co-occurring items in customer transactions.
ii.	Generate actionable insights to optimize retail strategies, including product placement, promotions, and inventory management.

METHODS:
i.	Data was inspected for missing values, outliers, and inconsistencies. Data exploration was performed to understand the dataset's structure, attributes, and inherent patterns.
ii.	The dataset was transformed into a transactional format suitable for Market Basket Analysis. 
iii.	Apriori association rule mining method was applied to identify frequent itemsets. Suitable thresholds for support, confidence, and lift were determined to filter out relevant associations.
iv.	Arranged final important results in a data frame based on decreasing strength of association (Lift-rule).

RESULTS:
i.	Identification of top 15 frequent itemset representing commonly purchased items were mineral water, burgers, turkey, chocolate, frozen vegetables, spaghetti, shrimp, grated cheese, eggs, cookies, 
French fries, herb and pepper, ground beef, tomatoes, milk
ii.	The generation of association rules with significant support, confidence, and lift values provided leading insights into item associations. Top 5 set of items frequently bought together were {Fromage blanc & Honey}, {Light cream & chicken}, {Pasta and ecalope}, {Pasta and Shrimp} &
{whole wheat pasta and olive oil}. 



CONCLUSIONS:
Customers who bought “fromage blanc” also bought “honey” with 25% chance and 5 unit of lift strength (strength of association). This rule appeared 0.0033 of transactions approximately 24 transactions. Similar rules and associations can also be observed for light cream and chicken. Thus, business owners or operations managers are cautioned to place such items in close proximity or attach discount coupons on such pairs of itemset.

DISCUSSIONS:
Market Basket Analysis has provided valuable insights into customer behavior and preferences, enabling retailers to make informed decisions to optimize retail strategies. By uncovering hidden patterns and associations among items purchased together, retailers can enhance product placement, promotions, and inventory management to drive business growth and improve the overall shopping experience for customers.
  








