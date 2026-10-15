SELECT Issue_Category,
       COUNT(*) AS Open_Items,
       SUM(Open_Amount_INR) AS Total_Open_Amount,
       ROUND (AVG(Ageing_Days), 0) AS Average_ageing_Days
       FROM grir_open_items
    GROUP BY Issue_Category
    ORDER BY Total_Open_Amount DESC;
