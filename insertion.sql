Insert into CustomerType(ID, Name) values (1,'Regular');
Insert into CustomerType(ID, Name) values (2,'Gold');

Insert into StoreItemType(ID, Name) values (1,'Comicbook');
Insert into StoreItemType(ID, Name) values (2,'Tshirt');

Insert into StoreItem(ItemID, Price, StoreItemTypeID) values (1, 10.00, 1);
Insert into StoreItem(ItemID, Price, StoreItemTypeID) values (2, 15.00, 1);
Insert into StoreItem(ItemID, Price, StoreItemTypeID) values (3, 20.00, 2);
Insert into StoreItem(ItemID, Price, StoreItemTypeID) values (4, 30.00, 2);

Insert into Comicbook(ItemID, ISBN, Title, PublishedDate, Copies) values (1, '9125315835831', 'Programming With C', to_date('2019-10-05','yyyy-MM-dd'), 5);
Insert into Comicbook(ItemID, ISBN, Title, PublishedDate, Copies) values (2, '9584343324234', 'Programming With Ruby', to_date('2019-11-12','yyyy-MM-dd'), 11);

Insert into Tshirt(ItemID, Sizes) values (3, 'M');
Insert into Tshirt(ItemID, Sizes) values (4, 'L');

Insert into Customer(CustID, Name, Phone, Address, CustTypeID) values (1, 'John', '3105268593', '549 Hawthorne', 1);
