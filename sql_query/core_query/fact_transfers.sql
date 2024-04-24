```1. Total Amount Transferred by Currency```
SELECT currency, SUM(amount) AS total_amount_transferred
FROM axelar.core.fact_transfers
GROUP BY currency;
```This query calculates the total amount transferred for each currency. It groups the transfers by currency and then calculates the sum of the amounts for each currency, providing insight into the distribution of transferred amounts across different currencies.```


```2. Average Amount Transferred per Transaction```
SELECT transfer_type, AVG(amount) AS avg_amount_transferred
FROM axelar.core.fact_transfers
GROUP BY transfer_type;
```This query calculates the average amount transferred for each transaction type. It groups the transfers by transfer type and then calculates the average amount for each type, providing insight into the typical transaction size for different types of transfers.```


```3. Top N Senders by Total Amount Transferred```
SELECT sender, SUM(amount) AS total_amount_transferred
FROM axelar.core.fact_transfers
GROUP BY sender
ORDER BY total_amount_transferred DESC
LIMIT 30;
```This query identifies the top N senders based on the total amount they transferred. It groups the transfers by sender, calculates the sum of the amounts for each sender, and then sorts the results in descending order by total amount transferred, providing insight into the most active senders.```


```4. Top N Receivers by Total Amount Received```
SELECT receiver, SUM(amount) AS total_amount_received
FROM axelar.core.fact_transfers
GROUP BY receiver
ORDER BY total_amount_received DESC
LIMIT 30;
```This query identifies the top N receivers based on the total amount they received. It groups the transfers by receiver, calculates the sum of the amounts for each receiver, and then sorts the results in descending order by total amount received, providing insight into the most active receivers.```


```5. Count of Successful vs. Failed Transfers```
SELECT tx_succeeded, COUNT(*) AS transfer_count
FROM axelar.core.fact_transfers
GROUP BY tx_succeeded;
```This query counts the number of transfers grouped by their success status. It provides insight into the distribution of successful and failed transfers.```