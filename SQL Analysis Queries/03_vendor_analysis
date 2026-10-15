SELECT
    Vendor_ID,
    Vendor_Name,
    Count(*) AS Open_Items,
    SUM(Open_Amount_INR) AS Total_Open_Amount,
    ROUND(AVG(Ageing_Days), 0) AS Average_Ageing_Days
FROM grir_open_items
GROUP BY
    Vendor_ID,
    Vendor_Name
ORDER BY Total_Open_Amount DESC
LIMIT 10;
