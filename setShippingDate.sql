set serveroutput on format wrapped;

Create or Replace Procedure setShippingDate(
    v_OrderID IN int, v_ShippedDate IN date
)
AS         
        my_code NUMBER;
        my_errm VARCHAR2(32000);
Begin  
    UPDATE ItemOrder
    SET ShippedDate = v_ShippedDate
    WHERE OrderID = v_OrderID;
    
    EXCEPTION 
        WHEN OTHERS THEN
            my_code := SQLCODE;
            my_errm := SQLERRM;
            dbms_output.put_line('Error code ' || my_code || ': ' || my_errm);


End setShippingDate;
/

show errors