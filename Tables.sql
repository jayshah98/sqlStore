Create table CustomerType(ID int not null, Name varchar(20) not null, Primary key(ID));

Create table StoreItemType(ID int not null, Name varchar(20) not null, Primary key(ID));
Create table Customer(CustID int not null, Name varchar(50) not null, Phone varchar(10), Address varchar(255), CustTypeID int not null, Primary key(CustID), Foreign key(CustTypeID) references CustomerType(ID));
Alter table Customer add constraint u_customer_phone Unique(Phone);
Create table SubscribedCustomer(CustID int not null, DateJoined date, Primary key(CustID), Foreign key(CustID) references Customer(CustID));

Create table StoreItem(ItemID int not null, Price number(10,2) not null, StoreItemTypeID int not null, Primary key(ItemID), Foreign key(StoreItemTypeID) references StoreItemType(ID));

Create table ItemOrder(OrderID int not null, CustID int not null, ItemID int not null, DateofOrder date not null, NoofItems int not null, ShippedDate date ,ShippingFee number(10,2), Tax number(10,4), Discount number(10,4),
Primary key(OrderID), Foreign key(CustID) references Customer(CustID), Foreign key(ItemID) references StoreItem(ItemID), constraint valid_ship_date Check(ShippedDate > DateofOrder));


Create table Tshirt(ItemID int not null, Sizes varchar(5) not null, Primary key(ItemID), Foreign key(ItemID) references StoreItem(ItemID));


Create table Comicbook(ItemID int not null, ISBN varchar(20) not null, Title varchar(50) not null, PublishedDate date not null, Copies int not null constraint valid_copies Check(Copies >= 0),  Primary key(ItemID), Foreign key(ItemID) references StoreItem(ItemID));
Alter table Comicbook add constraint u_comicbook_isbn Unique(ISBN);
