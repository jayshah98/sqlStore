Create or Replace Trigger Tri_CustomerTypeChanged
After Update 
on CUSTOMER
for each row 

Begin
    if :new.CustTypeID = 2 then
        UPDATE ItemOrder
        SET ShippingFee = 0
        WHERE ShippedDate IS NULL
            AND CustID = :new.CustID;
    end if;
END;
/
show errors;


