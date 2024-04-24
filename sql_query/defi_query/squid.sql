```1. Total Amount Transferred by Token Symbol```
SELECT token_symbol, SUM(amount) AS total_amount_transferred
FROM axelar.defi.ez_bridge_squid
GROUP BY token_symbol;
```This query calculates the total amount transferred for each token symbol. It groups the transfers by token symbol and then calculates the sum of the amounts for each token symbol, providing insight into the distribution of transferred amounts across different tokens.```


```2. Count of Transactions by Source Chain```
SELECT source_chain, COUNT(*) AS transaction_count
FROM axelar.defi.ez_bridge_squid
GROUP BY source_chain;
```This query counts the number of transactions grouped by their source chain. It provides insight into the distribution of transactions originating from different source chains.```


```3. Count of Transactions by Destination Chain```
SELECT destination_chain, COUNT(*) AS transaction_count
FROM axelar.defi.ez_bridge_squid
GROUP BY destination_chain;
```This query counts the number of transactions grouped by their destination chain. It provides insight into the distribution of transactions sent to different destination chains.```


```4. Top N Receivers by Total Amount Received```
SELECT receiver, SUM(amount) AS total_amount_received
FROM axelar.defi.ez_bridge_squid
GROUP BY receiver
ORDER BY total_amount_received DESC
LIMIT 30;
```This query identifies the top N receivers based on the total amount they received. It groups the transfers by receiver, calculates the sum of the amounts received for each receiver, and then sorts the results in descending order by total amount received, providing insight into the most active receivers.```