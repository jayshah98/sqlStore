set serveroutput on format wrapped;

Create or Replace Procedure showItemOrders(
    v_CustomerID IN int, v_from_ShippedDate IN date, c_result OUT SYS_REFCURSOR
)
AS          
Begin     

    OPEN c_result FOR    
        SELECT C.CustID, C.Name, C.Phone, C.Address, I.OrderID, I.ItemID, COALESCE(CB.Title, T.Sizes,'') as Title, I.DateofOrder, I.ShippedDate,
            (S.Price * I.NoofItems) as Total, 
            ((S.Price * I.NoofItems) - (S.Price * I.NoofItems) * I.Discount * 1.0 / 100) * I.Tax * 1.0 / 100 as Tax,
            (S.Price * I.NoofItems) * I.Discount * 1.0 / 100 as Discount,
            I.ShippingFee,
            ((S.Price * I.NoofItems) - (S.Price * I.NoofItems) * I.Discount * 1.0 / 100) + (((S.Price * I.NoofItems) - (S.Price * I.NoofItems) * I.Discount * 1.0 / 100) * I.Tax * 1.0 / 100) + I.ShippingFee as GrandTotal
        FROM Customer C 
            INNER JOIN ItemOrder I ON C.CustID = I.CustID
            INNER JOIN StoreItem S ON I.ItemID = S.ItemID
            LEFT JOIN Comicbook CB ON CB.ItemID = S.ItemID
            LEFT JOIN Tshirt T ON T.ItemID = S.ItemID
        WHERE 
            C.CustID = v_CustomerID
            AND I.ShippedDate > v_from_ShippedDate;    

End showItemOrders;
/

show errors;