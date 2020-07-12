CREATE OR REPLACE FUNCTION computeTotal(v_OrderId int)
RETURN number IS 
   total number(10,2) := 0.0; 
   v_Price StoreItem.Price%TYPE;
   v_Qty ItemOrder.NoofItems%TYPE;
   v_Tax ItemOrder.Tax%TYPE;
   v_Discount ItemOrder.Discount%TYPE;
   v_ShippingFee ItemOrder.ShippingFee%TYPE;   
BEGIN 
   SELECT S.Price, I.NoOfItems,I.Tax, I.Discount, I.ShippingFee INTO v_Price,v_Qty,v_Tax, v_Discount, v_ShippingFee
   FROM ItemOrder I, StoreItem S
   WHERE I.ItemID = S.ItemID
    AND I.OrderID = v_OrderId;
    
    total:= v_Price * v_Qty;
    total:= total - ((total * v_Discount * 1.0)/100);    
    total:= total + ((total * v_Tax * 1.0)/100);
    total:= total + v_ShippingFee;
   RETURN total; 
END; 
/ 
show error;