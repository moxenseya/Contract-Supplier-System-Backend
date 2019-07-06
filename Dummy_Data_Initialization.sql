use ContractSuppliesSystem;



DROP TABLE IF EXISTS Projects;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Contracts;
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS ToSupply;
DROP TABLE IF EXISTS MadeOf;

create table Projects
(
ProjectNo INT NOT NULL PRIMARY KEY,
ProjectData [varchar](50) NOT NULL
);



create table Suppliers
(
SupplierNo INT NOT NULL PRIMARY KEY,
SupplierName [varchar](50) NOT NULL,
SuplierAddress [varchar](50) NOT NULL);



create table Contracts
(
ContractNo INT NOT NULL PRIMARY KEY,
SupplierNo INT NOT NULL REFERENCES Suppliers (SupplierNo),
DateOfContract DATE NOT NULL
)

create table Items
(
ItemNo INT NOT NULL PRIMARY KEY,
ItemDesc [varchar](50) NOT NULL
);


create table Orders
(
OrderNo INT NOT NULL PRIMARY KEY,
DateRequired DATE NOT NULL,
DateCompleted DATE NOT NULL,
ContractNo INT NOT NULL REFERENCES Contracts (ContractNo),
ProjectNo INT NOT NULL REFERENCES Projects (ProjectNo)

);

create table ToSupply
(
ContractNo INT NOT NULL,
ItemNo INT  NOT NULL,
ContractAmt FLOAT  NOT NULL,
ContractPrice FLOAT  NOT NULL,
CONSTRAINT PK_TOSUPPLY PRIMARY KEY (ContractNo, ItemNo),
FOREIGN KEY (ContractNo) REFERENCES Contracts(ContractNo),
FOREIGN KEY (ItemNo) REFERENCES Items(ItemNo)

)


create table MadeOf
(
OrderNo INT NOT NULL,
ItemNo INT  NOT NULL,
OrderQty INT NOT NULL,
CONSTRAINT PK_MadeOf PRIMARY KEY (OrderNo, ItemNo),
FOREIGN KEY (OrderNo) REFERENCES Orders(OrderNo),
FOREIGN KEY (ItemNo) REFERENCES Items(ItemNo)

);




BULK INSERT ContractSuppliesSystem.dbo.Projects
    FROM 'C:\Users\syeda\Desktop\CSVs\Projects.csv'
    WITH
    (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    --ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\ProjectsErrors.csv',
    TABLOCK
    )


BULK INSERT ContractSuppliesSystem.dbo.Suppliers
FROM 'C:\Users\syeda\Desktop\CSVs\Suppliers.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


BULK INSERT ContractSuppliesSystem.dbo.Contracts
FROM 'C:\Users\syeda\Desktop\CSVs\Contracts.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


BULK INSERT ContractSuppliesSystem.dbo.Items
FROM 'C:\Users\syeda\Desktop\CSVs\Items.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


BULK INSERT ContractSuppliesSystem.dbo.Orders
FROM 'C:\Users\syeda\Desktop\CSVs\Orders.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


BULK INSERT ContractSuppliesSystem.dbo.ToSupply
FROM 'C:\Users\syeda\Desktop\CSVs\ToSupply.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


BULK INSERT ContractSuppliesSystem.dbo.MadeOf
FROM 'C:\Users\syeda\Desktop\CSVs\MadeOf.csv'
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR = ',',  --CSV field delimiter
ROWTERMINATOR = '\n',   --Use to shift the control to next row
--ERRORFILE = 'C:\Users\syeda\Desktop\CSVs\Errors\SuppliersErrors.csv',
TABLOCK
)


