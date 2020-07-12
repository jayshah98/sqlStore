-- FIRST WITH HIGHER QUANTITY
exec addItemOrder(1,1,1,to_date('2020-05-30','yyyy-MM-dd'),15,to_date('2020-10-05','yyyy-MM-dd'));
-- AND GOT ERROR AS EXPECTED


-- SECOND WITH LOWER QUANTITY
exec addItemOrder(1,1,1,to_date('2020-05-30','yyyy-MM-dd'),4,to_date('2020-10-05','yyyy-MM-dd'));
-- record created successfully

exec addItemOrder(2,2,1,to_date('2020-04-30','yyyy-MM-dd'),7,to_date('2020-10-05','yyyy-MM-dd'));

insert into SubscribedCustomer(CustID, DateJoined) values (1,to_date('2019-09-05','yyyy-MM-dd'));
-- Update CustomerType from REgular to Gold
UPDATE CUSTOMER SET CUSTTYPEID=2 WHERE CUSTID=1;

--calling store procedure to update ship date
exec setShippingDate(2,to_date('2020-05-31','yyyy-MM-dd'));

select computetotal(1) from dual;
select computetotal(2) from dual;

-- ShippedDate is higher
variable resultCursor refcursor;
exec showItemOrders(1, to_date('2020-05-25','yyyy-MM-dd'), :resultCursor);
print resultCursor;

---ShippedDate is lower so no queries
variable resultCursor refcursor;
exec showItemOrders(2, to_date('2020-06-01','yyyy-MM-dd'), :resultCursor);
print resultCursor;
