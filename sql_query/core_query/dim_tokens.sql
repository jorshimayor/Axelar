-- Schema: axelar.core.dim_tokens
```1. Count of Tokens by Label Type```
SELECT label_type, COUNT(*) AS token_count
FROM axelar.core.dim_tokens
GROUP BY label_type;
```This query counts the number of tokens belonging to each label type. It groups the tokens by their label type and then counts the occurrences of tokens within each group. The result shows how many tokens are associated with each label type, providing insight into the distribution of token categories.```


```2. Top N Tokens by Project Name```
SELECT project_name, label, COUNT(*) AS token_count
FROM axelar.core.dim_tokens
GROUP BY project_name, label
ORDER BY token_count DESC
LIMIT 20;
```This query identifies the most common tokens within each project. It groups the tokens by project name and label, counts the occurrences of each token within each project, and then sorts the results in descending order by token count. The 'LIMIT N' clause restricts the output to the top N tokens for each project, providing insight into the popularity of tokens within different projects.```


```3. Average Decimal Value by Label Type```
SELECT label_type, AVG(decimal) AS avg_decimal
FROM axelar.core.dim_tokens
GROUP BY label_type;
```This query calculates the average decimal value for each label type. It groups the tokens by their label type and then computes the average value of the 'decimal' column within each group. This can provide insight into the typical precision or scale of token amounts within different label types.```


```4.*Tokens with Secondary Addresses```
SELECT label, alias
FROM axelar.core.dim_tokens
WHERE alias IS NOT NULL;
```This query retrieves tokens that have secondary addresses associated with them. It selects the label (name) of the token along with its secondary address (alias) where available. This can provide insight into tokens that have additional identifiers or locations associated with them.```


```5. **Tokens with Metadata```
SELECT label, raw_metadata
FROM axelar.core.dim_tokens
WHERE raw_metadata IS NOT NULL;
```This query fetches tokens that have additional metadata associated with them. It selects the label (name) of the token along with its raw metadata, which contains extra information about the token in JSON format. This can provide insight into tokens that have richer details or attributes associated with them.```


```6. **Tokens Inserted per Day```
SELECT DATE(inserted_timestamp) AS insert_date, COUNT(*) AS token_count
FROM axelar.core.dim_tokens
GROUP BY insert_date
ORDER BY insert_date;
```This query calculates the number of tokens inserted into the table on each day. It extracts the date part from the 'inserted_timestamp' column, groups the tokens by insertion date, and then counts the occurrences of tokens for each day. This can provide insight into the rate of token additions over time.```


```7. **Tokens Last Modified per Day```
SELECT DATE(modified_timestamp) AS modify_date, COUNT(*) AS token_count
FROM axelar.core.dim_tokens
GROUP BY modify_date
ORDER BY modify_date;
```This query calculates the number of tokens that were last modified on each day. It extracts the date part from the 'modified_timestamp' column, groups the tokens by modification date, and then counts the occurrences of tokens for each day. This can provide insight into recent updates or changes to token data.```
