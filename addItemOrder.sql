set serveroutput on format wrapped;

Create or Replace Procedure addItemOrder(
    v_OrderID IN int, v_ItemID IN int, v_CustomerID IN int, v_DateOrdered IN date, v_QTY IN int, v_ShippedDate IN date
)
AS 
        v_NumCopies Comicbook.Copies%TYPE;
        v_ItemTypeId StoreItem.StoreItemTypeID%TYPE;
        v_TypeID Customer.CustTypeID%TYPE;
        v_ShippingFee ItemOrder.ShippingFee%TYPE := 0;
        v_Discount ItemOrder.Discount%TYPE := 0;
        v_Price StoreItem.Price%TYPE;
        my_code NUMBER;
        my_errm VARCHAR2(32000);
Begin  
    
    SELECT StoreItemTypeID INTO v_ItemTypeId FROM StoreItem WHERE ItemID = v_ItemID;

    IF v_ItemTypeId = 1 THEN
        Select Copies into v_NumCopies from Comicbook where ItemID = v_ItemID;    
        if v_NumCopies <= v_QTY then 
            DBMS_OUTPUT.PUT_LINE('Error: Not enough quantity available ');
            return;
        end if;               
    END IF;

    v_ShippingFee:= 10.00;

    Select CustTypeID into v_TypeID from Customer where CustID = v_CustomerID;
    if v_TypeID = 2 then 
        select price into v_Price from StoreItem where ItemID = v_ItemID;
        if v_Price*v_QTY > 100 then
            v_Discount := 10;
        end if;        
    end if;

        insert into ItemOrder(OrderID, CustID, ItemID, DateofOrder, NoofItems,ShippedDate, ShippingFee, Tax, Discount) values (v_OrderID, v_CustomerID, v_ItemID, v_DateOrdered, v_QTY,NULL, v_ShippingFee, 5, v_Discount);
        update Comicbook set Copies = v_NumCopies - v_QTY where ItemID = v_ItemID;
    COMMIT;
    
    EXCEPTION 
        WHEN OTHERS THEN
            ROLLBACK;
            my_code := SQLCODE;
            my_errm := SQLERRM;
            dbms_output.put_line('Error code ' || my_code || ': ' || my_errm);


End addItemOrder;
/

show errors