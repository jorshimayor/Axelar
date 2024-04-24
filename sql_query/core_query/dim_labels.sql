-- Schema: axelar.core.dim_labels
```1. Count of Tokens by Label Type```
```This query helps you understand how many tokens belong to each category or type. It counts the number of tokens for each unique label type and displays the result. For example, if you have label types like "Cryptocurrency", "NFT", and "Security Token", this query will show you how many tokens fall into each of these categories.```
SELECT label_type, COUNT(*) AS token_count
FROM axelar.core.dim_labels
GROUP BY label_type;



```2. Top N Tokens by Project Name```
```This query helps you identify the most popular tokens associated with different projects. It counts the number of occurrences of each token within each project name and then sorts them in descending order. By specifying a value for 'N', you can limit the results to show only the top N tokens. This can be useful for understanding which tokens are most prevalent within specific projects.```
SELECT
  address_name,
  label,
  COUNT(*) AS token_count
FROM
  axelar.core.dim_labels
GROUP BY
  address_name,
  label
ORDER BY
  token_count DESC
LIMIT
  10;


```3. Tokens with Primary Addresses```
```This query retrieves tokens that have secondary addresses associated with them, if available. It selects the label (name) of the token along with its secondary address. Secondary addresses could be additional identifiers or locations associated with a token, providing more context about its usage or ownership.```
SELECT label, address_name
FROM axelar.core.dim_labels
WHERE address_name IS NOT NULL;


```5. Tokens with Metadata```
```This query fetches tokens that have additional metadata associated with them. Metadata contains extra information about the token, such as descriptions, attributes, or properties, stored in JSON format. By selecting tokens with non-null metadata, you can access richer details about those tokens.```
SELECT label, raw_metadata
FROM axelar.core.dim_labels
WHERE raw_metadata IS NOT NULL;


```6. Tokens Inserted per Day```
```This query calculates the number of tokens inserted into the database on each day. It extracts the date part from the 'inserted_timestamp' column and counts the occurrences of tokens for each day. This helps track the rate of token additions over time, which can be useful for monitoring data growth or analyzing temporal trends.```
SELECT DATE(inserted_timestamp) AS insert_date, COUNT(*) AS token_count
FROM axelar.core.dim_labels
GROUP BY insert_date
ORDER BY insert_date;


```7. Tokens Last Modified per Day```
```Similar to the previous query, this one calculates the number of tokens that were last modified on each day. It extracts the date part from the 'modified_timestamp' column and counts the occurrences of tokens for each day. This can be helpful for tracking recent updates or changes to token data.```
SELECT DATE(modified_timestamp) AS modify_date, COUNT(*) AS token_count
FROM axelar.core.dim_labels
GROUP BY modify_date
ORDER BY modify_date;