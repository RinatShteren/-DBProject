UPDATE medicinies
SET Qualitity_available_in_stock = Qualitity_available_in_stock + 10
WHERE Qualitity_available_in_stock < 5
AND EXISTS (
    SELECT *
    FROM medication_visit MV  )

select * from  medicinies M where M.N_NAME ='Bedaquiline' or M.N_NAME ='Risankizumab' or M.N_NAME ='Tildrakizumab'
