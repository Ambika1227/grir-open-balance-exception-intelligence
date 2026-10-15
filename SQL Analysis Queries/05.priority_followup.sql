SELECT
    CASE
        WHEN Ageing_Days <= 30 THEN '0-30 Days'
        WHEN Ageing_Days <=60 THEN '31-60 Days'
        WHEN Ageing_Days <=90 THEN '61-90 Days'
        WHEN Ageing_Days <=90 THEN '91-180 Days'
        ELSE '180+ Days'
    END AS Ageing_Bucket,
    COUNT(*) AS Open_items,
    SUM(Open_Amount_INR) AS Total_Open_Amount,
    ROUND(AVG(Ageing_Days),0) AS Average_Ageing
FROM grir_open_items
GROUP BY
    CASE
        WHEN Ageing_Days <= 30 THEN '0-30 Days'
        WHEN Ageing_Days <=60 THEN '31-60 Days'
        WHEN Ageing_Days <=90 THEN '61-90 Days'
        WHEN Ageing_Days <=90 THEN '91-180 Days'
        ELSE '180+ Days'
    END
ORDER BY MIN(Ageing_Days);
