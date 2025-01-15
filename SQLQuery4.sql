select * from dbo.customers

select * from dbo.geography

select 
c.customerID, 
c.CustomerName, 
c.Email, 
c.gender, 
c.Age,
g.country, 
g.city from dbo.customers c 
left join 
dbo.geography g on c.GeographyID = g.GeographyID