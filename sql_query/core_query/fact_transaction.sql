```1. Count of Transactions by Status```
SELECT tx_succeeded, COUNT(*) AS transaction_count
FROM axelar.core.fact_transactions
GROUP BY tx_succeeded;
```This query counts the number of transactions grouped by their success status. It provides insight into the distribution of successful and failed transactions.```


```2. Average Gas Used per Transaction```
SELECT AVG(gas_used) AS avg_gas_used
FROM axelar.core.fact_transactions;
```This query calculates the average amount of gas used per transaction. Gas consumption is an important metric in blockchain transactions, and this insight can help in understanding the typical gas usage pattern.```


```3. Top N Transactions by Fee```
SELECT tx_id, fee
FROM axelar.core.fact_transactions
ORDER BY CAST(fee AS NUMBER) DESC
LIMIT 30;
```This query retrieves the top N transactions based on the transaction fee paid. It orders the transactions by fee in descending order and then limits the result to the top N transactions. This insight can help identify transactions with the highest fees.```


```4. Transactions with Non-Zero Error Codes```
SELECT *
FROM axelar.core.fact_transactions
WHERE tx_code <> 0
LIMIT 100;
```This query fetches transactions that encountered errors during execution, indicated by non-zero error codes. It provides insight into transactions that failed due to specific error conditions.```


```5. Transactions by Day```
SELECT DATE(block_timestamp) AS transaction_date, COUNT(*) AS transaction_count
FROM axelar.core.fact_transactions
GROUP BY transaction_date
ORDER BY transaction_date;
```This query counts the number of transactions recorded on each day. It extracts the date part from the `block_timestamp` column, groups the transactions by date, and then provides insights into transaction volume trends over time.```