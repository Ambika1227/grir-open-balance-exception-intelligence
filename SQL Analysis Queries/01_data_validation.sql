– 1. Check total number of records
SELECT COUNT(*) AS total_records
FROM grir_open_items;

– 2. Check duplicate GRIR item IDs
SELECT
GRIR_Item_ID,
COUNT() AS duplicate_count
FROM grir_open_items
GROUP BY GRIR_Item_ID
HAVING COUNT() > 1;

– 3. Check missing values in important columns
SELECT
SUM(CASE WHEN GRIR_Item_ID IS NULL OR TRIM(GRIR_Item_ID) = ‘’ THEN 1 ELSE 0 END) AS missing_grir_id,
SUM(CASE WHEN Vendor_Name IS NULL OR TRIM(Vendor_Name) = ‘’ THEN 1 ELSE 0 END) AS missing_vendor,
SUM(CASE WHEN PO_Number IS NULL OR TRIM(PO_Number) = ‘’ THEN 1 ELSE 0 END) AS missing_po,
SUM(CASE WHEN Open_Amount_INR IS NULL THEN 1 ELSE 0 END) AS missing_open_amount,
SUM(CASE WHEN Ageing_Days IS NULL THEN 1 ELSE 0 END) AS missing_ageing
FROM grir_open_items;

– 4. Check negative and zero open amounts
SELECT *
FROM grir_open_items
WHERE Open_Amount_INR <= 0;

– 5. Check invalid ageing values
SELECT *
FROM grir_open_items
WHERE Ageing_Days < 0 OR Ageing_Days IS NULL;

– 6. Check missing invoice dates
– Missing invoice dates may be valid when the issue is Missing Invoice
SELECT *
FROM grir_open_items
WHERE Invoice_Date IS NULL
AND Issue_Category <> ‘Missing Invoice’;

– 7. Check date consistency
SELECT *
FROM grir_open_items
WHERE Invoice_Date < GR_Date;

– 8. Check issue category distribution
SELECT
Issue_Category,
COUNT(*) AS total_items,
SUM(Open_Amount_INR) AS total_open_amount
FROM grir_open_items
GROUP BY Issue_Category
ORDER BY total_open_amount DESC;
